# Docker Images

 - Dockerfile definitions, primarily for use in Concourse pipelines.

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
