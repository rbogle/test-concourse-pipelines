#!/bin/sh

# login to fly and get token
fly -t ${CONCOURSE_TARGET} login -c ${CONCOURSE_URL} -u ${CONCOURSE_USER} -p ${CONCOURSE_PASSWD}
fly -t ${CONCOURSE_TARGET} sync
BEARER_TOKEN=$(cat ~/.flyrc | grep value | awk '{ print $2 }')
echo "${BEARER_TOKEN}" >  build_info/bearer-token

# Output build info
cat metadata/build-id > build_info/build-id
cat metadata/build-name > build_info/build-name
cat metadata/build-job-name > build_info/build-job-name
cat metadata/build-pipeline-name > build_info/build-pipeline-name
cat metadata/build-team-name > build_info/build-team-name
cat metadata/atc-external-url > build_info/atc-external-url

