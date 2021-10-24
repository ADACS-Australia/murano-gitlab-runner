#!/bin/bash -xeu

RUNNER_NAME="$1"
CI_SERVER_URL="$2"
REGISTRATION_TOKEN="$3"
RUNNER_TAG_LIST="$4"
RUNNER_EXECUTOR="docker"
DOCKER_IMAGE="docker:latest" # use this docker image if none is specified in the workflow

# Download gitlab-runner (while auto updates are running)
wget https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb

# Wait for auto updates to finish before installing docker
while true; do
  sudo apt-get install -y -q docker.io > /dev/null && break || echo "Waiting 10s for apt..."; sleep 10
done

# Install gitlab-runner
sudo dpkg -i gitlab-runner_amd64.deb

# Register runner
sudo gitlab-runner register \
  --non-interactive \
  --name "$RUNNER_NAME" \
  --url "$CI_SERVER_URL" \
  -r "$REGISTRATION_TOKEN" \
  --executor "$RUNNER_EXECUTOR" \
  --docker-image "$DOCKER_IMAGE" \
  --tag-list "$RUNNER_TAG_LIST" \
  --run-untagged
