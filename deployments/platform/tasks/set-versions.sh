#!/bin/sh

# login to fly and get token
fly -t ${CONCOURSE_TARGET} login -c ${CONCOURSE_URL} -u ${CONCOURSE_USER} -p ${CONCOURSE_PASSWD}
fly -t ${CONCOURSE_TARGET} sync 
BEARER_TOKEN=$(cat ~/.flyrc | grep value | awk '{ print $2 }')
echo "${BEARER_TOKEN}" >  metadata/bearer-token

BUILD_ID=$(cat metadata/build-id)
BUILD_NAME=$(cat metadata/build-name)
BUILD_JOB_NAME=$(cat metadata/build-job-name)
BUILD_PIPELINE_NAME=$(cat metadata/build-pipeline-name)
BUILD_TEAM_NAME=$(cat metadata/build-team-name)

# Output build info
VERSIONS=$(fly -t ${CONCOURSE_TARGET} curl /api/v1/builds/${BUILD_ID}/resources  -- -s | jq '.inputs | map( { (.name): .version } ) | add')
echo ${VERSIONS} | yq -P > versions/resource_versions.yml 

echo
echo "Resource Versions used in build:"
echo ${VERSIONS} | jq 

