# Docker Images

 - Pipeline for building and testing docker images
    - See README.md in `ci` folder
 - Dockerfile definitions, primarily for use in Concourse pipelines


### concourse-alpine
  - Alpine-based Docker container for Concourse pipelines
  - Lightweight base image with common linux tools and major cloud CLI's
  - To use in Concourse pipeline:
 ```
   image_resource:
     type: docker-image
     source:
       repository: cgicloudnative/concourse-alpine
 ```
  - Docker `run` command to start an interactive bash session
 ```
 docker run -it cgicloudnative/concourse-alpine /bin/bash
 ```

### concourse-ubuntu
 - Ubuntu Xenial-based Docker container for Concourse pipelines
 - Base image with common linux tools and major cloud CLI's
 - To use in Concourse pipeline:
```
  image_resource:
    type: docker-image
    source:
      repository: cgicloudnative/concourse-ubuntu
```
  - Docker `run` command to start an interactive bash session
 ```
 docker run -it cgicloudnative/concourse-ubuntu /bin/bash
 ```
