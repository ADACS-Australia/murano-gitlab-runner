#!/bin/bash -xeu

RUNNER_NAME="$1"
CI_SERVER_URL="$2"
REGISTRATION_TOKEN="$3"
RUNNER_TAG_LIST="$4"
RUNNER_EXECUTOR="shell"

# Wait for auto updates to finish
while true; do
  sudo apt-get install -y -q gitlab-runner > /dev/null && break || echo "Waiting 10s for apt..."; sleep 10
done

sudo gitlab-runner register \
  --non-interactive \
  --name "$RUNNER_NAME" \
  --url "$CI_SERVER_URL" \
  -r "$REGISTRATION_TOKEN" \
  --executor "$RUNNER_EXECUTOR" \
  --tag-list "$RUNNER_TAG_LIST"
