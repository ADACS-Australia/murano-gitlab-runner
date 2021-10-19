#!/bin/bash -xeu

RUNNER_NAME=$1
RUNNER_URL=$2
RUNNER_TOKEN=$3

sudo yum -y update
wget https://gitlab-runner-downloads.s3.amazonaws.com/latest/rpm/gitlab-runner_amd64.rpm
sudo rpm -i gitlab-runner_amd64.rpm
sudo gitlab-runner register --name $RUNNER_NAME --url $RUNNER_URL --token $RUNNER_TOKEN
