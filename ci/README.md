## Jobs
- `build-docker-latest-rc`
  - Monitors git repo for changes and triggers the pipeline
  - Builds the docker image from the `Dockerfile` contained in the repo
    - Utilize `semver.sh` script to include the `semver` value which is incremented immediately prior to the build and written to the docker image
  - Pushes the docker image to docker hub with the tag: `latest-rc`
- `test-docker-image`
  - Pulls the previously-built docker image and checks for the presence of a certain set of commands/CLI's, defined in `ci/scripts/test-docker.sh`
  - If those commands exist, this job passes and the next job is kicked off
- `verify-docker-version`
  - Compares the `semver` in git repo with the version file written to the docker image during the build
- `push-docker-latest`
  - Pulls the `latest-rc` docker image and re-pushes that exact image with tag: `latest`
