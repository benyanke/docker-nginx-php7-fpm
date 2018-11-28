# Nginx + PHP7-FPM docker image for Laravel

This is a [Docker](http://www.docker.com) image for [Nginx](http://nginx.org/) and [PHP7 FPM](http://php-fpm.org/) suited to run [Laravel PHP Framework](http://laravel.com/).

An automated build for this repo is available on the [Docker Hub](https://registry.hub.docker.com/u/benyanke/nginx-php7-fpm/).

This is a fork of [Docker Laravel](https://github.com/vcarreira/docker-nginx-php7-fpm).

This image is used as a base for [Laravel Docker Development Environment](https://github.com/benyanke/laravel-dev-env), and other projects.


## Tags

This repo uses two dockerfiles: `Dockerfile-7.2`, tracking tag `7.2`, and `Dockerfile-7.3`, tracking tag `7.3`. 

## New Packages and Modules

If you need additional PHP modules, add them in the [base image](https://github.com/benyanke/docker-php7), not 
this one, as this image is intended to only add nginx and FPM on top of a fully-prepared PHP image. I intend 
these images to be as flexible as possible, so if you see a missing package you want, just request it, or put 
in a PR to add it.
