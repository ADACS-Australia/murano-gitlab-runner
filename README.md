# GitLab self-hosted runner Murano package

This repo contains a Murano (OpenStack) package for the Nectar research cloud. It allows you to set up a GitLab self-hosted runner easily from the dashboard. You can find the most relevant steps of the installation in `deploy.sh`. Currently, it only supports Ubuntu 20.04 LTS.

The runner uses the `docker` executor (https://docs.gitlab.com/runner/executors/docker.html), with `docker:latest` as the default image.

## Build
You can build the package with the makefile
```
make build
```
This will create a `.zip` file that you can manually upload to your Nectar project in the dashboard.

Alternatively, if you have user/application credentials loaded in your environment and have the Murano CLI installed, you can build + upload with
```
make upload
```
