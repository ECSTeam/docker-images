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
