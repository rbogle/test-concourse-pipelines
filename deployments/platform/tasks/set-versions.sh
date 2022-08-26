#!/bin/sh

pwd

# login to fly and get token
fly -t ${CONCOURSE_TARGET} login -c ${CONCOURSE_URL} -u ${CONCOURSE_USER} -p ${CONCOURSE_PASSWD}
fly -t ${CONCOURSE_TARGET} sync
BEARER_TOKEN=$(cat ~/.flyrc | grep value | awk '{ print $2 }')
echo "${BEARER_TOKEN}" >  build_info/bearer-token

# Output build info
echo "${BUILD_ID}" > build_info/build-id
echo "${BUILD_NAME}" > build_info/build-name
echo "${BUILD_JOB_NAME}" > build_info/build-job-name
echo "${BUILD_PIPELINE_NAME}" > build_info/build-pipeline-name
echo "${BUILD_TEAM_NAME}" > build_info/build-team-name
echo "${ATC_EXTERNAL_URL}" > build_info/atc-external-url

