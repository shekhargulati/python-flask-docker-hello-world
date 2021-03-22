#!/usr/bin/env bash
# apply a kubernetes manifest and wait for rollout
#
# usage:
#   apply.sh manifest/DEPLOYMENT_FILE.yml DEPLOYMENT_NAME REPLICAS IMAGE
#
# example:
#   apply.sh manifest/deployment.yml addressbook-stable 3 $DOCKER_USERNAME/semaphore-demo-cicd-kubernetes:latest
#

set -e

export manifest=$1
export deployment=$2
export replicas=$3
export img=$4

apply_tmp=$(mktemp)
cat $manifest | envsubst | tee $apply_tmp
kubectl apply -f $apply_tmp
kubectl rollout status -f $apply_tmp --timeout=120s
rm -f $apply_tmp
