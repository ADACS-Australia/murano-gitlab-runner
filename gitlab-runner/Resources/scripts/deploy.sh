#!/bin/bash -xeu

export RUNNER_NAME="$1"
export CI_SERVER_URL="$2"
export REGISTRATION_TOKEN="$3"
export RUNNER_EXECUTOR="shell"

wget https://gitlab-runner-downloads.s3.amazonaws.com/latest/deb/gitlab-runner_amd64.deb

while true; do
  sudo dpkg -i gitlab-runner_amd64.deb && break || echo "Waiting 10s for apt..."; sleep 10
done

sudo gitlab-runner register --non-interactive --name "$RUNNER_NAME" --url "$CI_SERVER_URL" -r "$REGISTRATION_TOKEN" --executor "$RUNNER_EXECUTOR"
