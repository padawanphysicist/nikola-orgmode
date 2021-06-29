# Docker image for Nikola with Org mode

This [Dockerfile](Dockerfile) creates a sandboxed environment for the [Nikola](https://getnikola.com/) static web site generator, including the plugins and dependencies necessary to author a site based on [Org-mode](https://orgmode.org/)

Pull this image from [Docker Hub](https://hub.docker.com/repository/docker/padawanphysicist/nikola-orgmode) with the command `docker pull padawanphysicist/nikola-orgmode`.

## Contains
This comes with the following software:
- GNU Emacs 28.0.50
- Org mode version 9.4.6

Since its only dependency is Docker, it should run on any platform with Docker installed. It may or may not work with earlier versions of docker.  To install docker on your system, see the [official docker installation instructions](https://docs.docker.com/installation).

## Installation
To pull the docker image. (Depending on your connection speed this is likely much faster than building your own):
```
$ docker pull padawanphysicist/nikola-orgmode
```

Alternatively to pulling the docker image build the docker image with:
```
$ docker build -t padawanphysicist/nikola-orgmode gitlab.com/padawanphysicist/nikola-orgmode
```

You can see your new image that you either pulled or built with this command:
```
$ docker images
```

If you have your page in the directory `/dir/foo`, you can start the docker environment with
```
docker run --rm -ti -v /dir/foo:/home/tesla/webpage nikola-orgmode bash
```

