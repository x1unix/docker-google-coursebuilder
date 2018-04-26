# Google Course Builder
> GCB Docker image

## About

This image contains [Google Course Builder](https://edu.google.com/openonline/course-builder/docs/1.11/index.html) bundled with Google Cloud SDK.

Prepared image available on [Docker Hub](https://hub.docker.com/r/x1unix/google-course-builder/)

### Exposed ports

* `8080` - Course Builder
* `8000` - Google Cloud Admin

## Building image

### Prerequisites

1. Docker
2. Git LFS

### Build 

1. Clone this repo:
```git clone https://github.com/x1unix/docker-google-coursebuilder.git```
2. Download missing files to `coursebuilder/lib` (had to remove due to GitHub's 100MB limit):
  - [`gaepytz-2011h.zip`](https://github.com/google/coursebuilder-resources/raw/master/lib/gaepytz-2011h.zip)
3. Build image using `build.cmd` command for Windows, or this command for Linux/Mac:
```bash
docker build --build-arg CLOUD_SDK_VERSION=159.0.0 --build-arg INSTALL_COMPONENTS="google-cloud-sdk-datastore-emulator" -t x1unix/google-course-builder:latest . 
```