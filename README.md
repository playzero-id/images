# PlayZero Images
## Forked from [Official Yolks Repo](https://github.com/pterodactyl/yolks)
A curated collection of core images that can be used with the PlayZero.id game server hosting platform. Each image is rebuilt
periodically to ensure dependencies are always up-to-date.

Images are hosted on `ghcr.io` and exist under the `games`, `installers`, and `images` spaces. The following logic
is used when determining which space an image will live under:

* `oses` — base images containing core packages to get you started.
* `games` — anything within the `games` folder in the repository. These are images built for running a specific game
or type of game.
* `installers` — anything living within the `installers` directory. These images are used by install scripts for different
Eggs within PlayZero.id, not for actually running a game server. These images are only designed to reduce installation time
and network usage by pre-installing common installation dependencies such as `curl` and `wget`.
* `images` — these are more generic images that allow different types of games or scripts to run. They're generally just
a specific version of software and allow different Eggs within PlayZero.id to switch out the underlying implementation. An
example of this would be something like Java or Python which are used for running bots, Minecraft servers, etc.

All of these images are available for `linux/amd64` and `linux/arm64` versions, unless otherwise specified, to use
these images on an arm64 system, no modification to them or the tag is needed, they should just work.

## Contributing

When adding a new version to an existing image, such as `java v42`, you'd add it within a child folder of `java`, so
`java/42/Dockerfile` for example. Please also update the correct `.github/workflows` file to ensure that this new version
is tagged correctly.

## Available Images

* [`base oses`](https://github.com/playzero-id/images/tree/master/oses)
  * [`alpine`](https://github.com/playzero-id/images/tree/master/oses/alpine)
    * `ghcr.io/playzero-id/oses:alpine`
  * [`debian`](https://github.com/playzero-id/images/tree/master/oses/debian)
    * `ghcr.io/playzero-id/oses:debian`
  * [`Ubuntu`](https://github.com/playzero-id/images/tree/master/oses/ubuntu)
    * `ghcr.io/playzero-id/oses:ubuntu`

* [`games`](https://github.com/playzero-id/images/tree/master/games)
  * [`rust`](https://github.com/playzero-id/images/tree/master/games/rust)
    * `ghcr.io/playzero-id/games:rust`
  * [`source`](https://github.com/playzero-id/images/tree/master/games/source)
    * `ghcr.io/playzero-id/games:source`

* [`golang`](https://github.com/playzero-id/images/tree/master/go)
  * [`go1.14`](https://github.com/playzero-id/images/tree/master/go/1.14)
    * `ghcr.io/playzero-id/images:go_1.14`
  * [`go1.15`](https://github.com/playzero-id/images/tree/master/go/1.15)
    * `ghcr.io/playzero-id/images:go_1.15`
  * [`go1.16`](https://github.com/playzero-id/images/tree/master/go/1.16)
    * `ghcr.io/playzero-id/images:go_1.16`
  * [`go1.17`](https://github.com/playzero-id/images/tree/master/go/1.17)
    * `ghcr.io/playzero-id/images:go_1.17`
  * [`go1.18`](https://github.com/playzero-id/images/tree/master/go/1.18)
    * `ghcr.io/playzero-id/images:go_1.18`
  * [`go1.19`](https://github.com/playzero-id/images/tree/master/go/1.19)
    * `ghcr.io/playzero-id/images:go_1.19`
  * [`go1.20`](https://github.com/playzero-id/images/tree/master/go/1.20)
    * `ghcr.io/playzero-id/images:go_1.20`
  * [`go1.21`](https://github.com/playzero-id/images/tree/master/go/1.21)
    * `ghcr.io/playzero-id/images:go_1.21`
  * [`go1.22`](https://github.com/playzero-id/images/tree/master/go/1.22)
    * `ghcr.io/playzero-id/images:go_1.22`
  * [`go1.23`](https://github.com/playzero-id/images/tree/master/go/1.23)
    * `ghcr.io/playzero-id/images:go_1.23`
  * [`go1.24`](https://github.com/playzero-id/images/tree/master/go/1.24)
    * `ghcr.io/playzero-id/images:go_1.24`
  * [`go1.25`](https://github.com/playzero-id/images/tree/master/go/1.25)
    * `ghcr.io/playzero-id/images:go_1.25`

* [`java`](https://github.com/playzero-id/images/tree/master/java)
  * [`java8`](https://github.com/playzero-id/images/tree/master/java/8)
    * `ghcr.io/playzero-id/images:java_8`
  * [`java8 - OpenJ9`](https://github.com/playzero-id/images/tree/master/java/8j9)
    * `ghcr.io/playzero-id/images:java_8j9`
  * [`java11`](https://github.com/playzero-id/images/tree/master/java/11)
    * `ghcr.io/playzero-id/images:java_11`
  * [`java11 - OpenJ9`](https://github.com/playzero-id/images/tree/master/java/11j9)
    * `ghcr.io/playzero-id/images:java_11j9`
  * [`java16`](https://github.com/playzero-id/images/tree/master/java/16)
    * `ghcr.io/playzero-id/images:java_16`
  * [`java16 - OpenJ9`](https://github.com/playzero-id/images/tree/master/java/16j9)
    * `ghcr.io/playzero-id/images:java_16j9`
  * [`java17`](https://github.com/playzero-id/images/tree/master/java/17)
    * `ghcr.io/playzero-id/images:java_17`
  * [`java17 - OpenJ9`](https://github.com/playzero-id/images/tree/master/java/17j9)
    * `ghcr.io/playzero-id/images:java_17j9`
  * [`java18`](https://github.com/playzero-id/images/tree/master/java/18)
    * `ghcr.io/playzero-id/images:java_18`
  * [`java18 - OpenJ9`](https://github.com/playzero-id/images/tree/master/java/18j9)
    * `ghcr.io/playzero-id/images:java_18j9`
  * [`java19`](https://github.com/playzero-id/images/tree/master/java/19)
    * `ghcr.io/playzero-id/images:java_19`
  * [`java19 - OpenJ9`](https://github.com/playzero-id/images/tree/master/java/19j9)
    * `ghcr.io/playzero-id/images:java_19j9`
  * [`java21`](https://github.com/playzero-id/images/tree/master/java/21)
    * `ghcr.io/playzero-id/images:java_21`
  * [`java21 - OpenJ9`](https://github.com/playzero-id/images/tree/master/java/21j9)
    * `ghcr.io/playzero-id/images:java_21j9`
  * [`java25`](https://github.com/playzero-id/images/tree/master/java/25)
    * `ghcr.io/playzero-id/images:java_25`
  * [`java25 - OpenJ9`](https://github.com/playzero-id/images/tree/master/java/25j9)
    * `ghcr.io/playzero-id/images:java_25j9`

* [`nodejs`](https://github.com/playzero-id/images/tree/master/nodejs)
  * [`node12`](https://github.com/playzero-id/images/tree/master/nodejs/12)
    * `ghcr.io/playzero-id/images:nodejs_12`
  * [`node14`](https://github.com/playzero-id/images/tree/master/nodejs/14)
    * `ghcr.io/playzero-id/images:nodejs_14`
  * [`node15`](https://github.com/playzero-id/images/tree/master/nodejs/15)
    * `ghcr.io/playzero-id/images:nodejs_15`
  * [`node16`](https://github.com/playzero-id/images/tree/master/nodejs/16)
    * `ghcr.io/playzero-id/images:nodejs_16`
  * [`node17`](https://github.com/playzero-id/images/tree/master/nodejs/17)
    * `ghcr.io/playzero-id/images:nodejs_17`
  * [`node18`](https://github.com/playzero-id/images/tree/master/nodejs/18)
    * `ghcr.io/playzero-id/images:nodejs_18`
  * [`node20`](https://github.com/playzero-id/images/tree/master/nodejs/18)
    * `ghcr.io/playzero-id/images:nodejs_20`

* [`python`](https://github.com/playzero-id/images/tree/master/python)
  * [`python3.7`](https://github.com/playzero-id/images/tree/master/python/3.7)
    * `ghcr.io/playzero-id/images:python_3.7`
  * [`python3.8`](https://github.com/playzero-id/images/tree/master/python/3.8)
    * `ghcr.io/playzero-id/images:python_3.8`
  * [`python3.9`](https://github.com/playzero-id/images/tree/master/python/3.9)
    * `ghcr.io/playzero-id/images:python_3.9`
  * [`python3.10`](https://github.com/playzero-id/images/tree/master/python/3.10)
    * `ghcr.io/playzero-id/images:python_3.10`
  * [`python3.11`](https://github.com/playzero-id/images/tree/master/python/3.11)
    * `ghcr.io/playzero-id/images:python_3.11`
  * [`python3.12`](https://github.com/playzero-id/images/tree/master/python/3.12)
    * `ghcr.io/playzero-id/images:python_3.12`
  * [`python3.13`](https://github.com/playzero-id/images/tree/master/python/3.13)
    * `ghcr.io/playzero-id/images:python_3.13`
  * [`python3.14`](https://github.com/playzero-id/images/tree/master/python/3.14)
    * `ghcr.io/playzero-id/images:python_3.15`
  * [`python3.15`](https://github.com/playzero-id/images/tree/master/python/3.15)
    * `ghcr.io/playzero-id/images:python_3.12`

* [dotNet](/dotnet)
  * [`dotnet2.1`](/dotnet/2.1)
    * `ghcr.io/playzero-id/images:dotnet_2.1`
  * [`dotnet3.1`](/dotnet/3.1)
    * `ghcr.io/playzero-id/images:dotnet_3.1`
  * [`dotnet5.0`](/dotnet/5)
    * `ghcr.io/playzero-id/images:dotnet_5`
  * [`dotnet6.0`](/dotnet/6)
    * `ghcr.io/playzero-id/images:dotnet_6`
  * [`dotnet7.0`](/dotnet/7)
    * `ghcr.io/playzero-id/images:dotnet_7`
  * [`dotnet8.0`](/dotnet/8)
    * `ghcr.io/playzero-id/images:dotnet_8`
  * [`dotnet9.0`](/dotnet/9)
    * `ghcr.io/playzero-id/images:dotnet_9`
  * [`dotnet10.0`](/dotnet/10)
    * `ghcr.io/playzero-id/images:dotnet_10`



### Installation Images

* [`alpine-install`](https://github.com/playzero-id/images/tree/master/installers/alpine)
  * `ghcr.io/playzero-id/installers:alpine`

* [`debian-install`](https://github.com/playzero-id/images/tree/master/installers/debian)
  * `ghcr.io/playzero-id/installers:debian`
