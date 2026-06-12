# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Pyrodactyl Images is a collection of Docker container images (forked from Pterodactyl Yolks) for use with the Pyrodactyl game server hosting platform. Each subdirectory contains versioned Dockerfiles for a specific runtime or OS. Images are built and pushed to `ghcr.io/pyrodactyl-oss/` via GitHub Actions.

## Building Images

There is no Makefile or local build script. Images are built directly with Docker:

```bash
# Build a specific image locally
docker build -t test-image ./java/21/

# Build for a specific platform
docker buildx build --platform linux/amd64 -t test-image ./python/3.12/

# Build multi-platform (requires buildx with a builder that supports it)
docker buildx build --platform linux/amd64,linux/arm64 -t test-image ./nodejs/20/
```

CI builds are triggered automatically via GitHub Actions on pushes to `main`/`master` or on the 1st of each month. Manual runs can be triggered via `workflow_dispatch` on the individual workflow files in `.github/workflows/`.

## No Tests or Linters

There is no test suite and no linting toolchain. Dockerfile correctness is validated only by a successful `docker build`. Style consistency is enforced by `.editorconfig` (tabs, 4-space tab width; 2-space indent for YAML; LF line endings).

## Repository Structure

Each top-level directory corresponds to an image category:

- `oses/` — Base OS images (alpine, debian, ubuntu); these are base layers for other images
- `images/` — Generic language runtimes: `go/`, `java/`, `nodejs/`, `python/`, `dotnet/`
- `games/` — Game-specific images (rust, source engine); amd64-only
- `installers/` — Lightweight Alpine/Debian images for egg installation helpers

Within each category, directories are named by version (e.g., `java/21/`, `python/3.12/`). Each contains a single `Dockerfile` and sometimes a shared `entrypoint.sh`.

## Dockerfile Conventions

All Dockerfiles follow the same pattern:

1. `FROM --platform=$TARGETOS/$TARGETARCH <base>` for multi-platform support
2. MIT license header and maintainer label
3. Install runtime + utilities (`curl`, `ca-certificates`, `git`, `tzdata`)
4. Create an unprivileged `container` user and group
5. Copy `entrypoint.sh` into the image
6. Set `WORKDIR /home/container`
7. `CMD` runs the entrypoint via `ash` (Alpine) or `bash` (Debian/Ubuntu)

## Entrypoint Script Pattern

All entrypoint scripts follow this logic:

1. Set `TZ` (default `UTC`) and detect internal Docker IP
2. `cd /home/container`
3. Print the runtime version for debugging
4. Parse the `STARTUP` env var: replace `{{VAR}}` with `${VAR}` syntax, then `eval` it
5. `exec env ${PARSED}` to launch the server process

## Adding a New Image Version

1. Create `<category>/<version>/Dockerfile` following existing sibling Dockerfiles
2. Add a corresponding `entrypoint.sh` if the category uses one
3. Add a build job to the relevant `.github/workflows/<category>.yml`, mirroring an existing job (update `tags`, `build-args`, path filters)
4. Update `README.md` with the new image tag

## CI/CD (GitHub Actions)

Each workflow file (`.github/workflows/`) handles one category. Key details:

- Uses `docker/build-push-action` with `push: true` to `ghcr.io`
- QEMU + Docker Buildx configured for `linux/amd64,linux/arm64` (except `games/`, which is `linux/amd64` only)
- Triggered by: push to `main`/`master` matching the category's path, monthly schedule (`0 0 1 * *`), or manual `workflow_dispatch`
- Authenticates with `GITHUB_TOKEN` (no additional secrets required)
