#!/bin/sh

cp ./versions/resource_versions.yml ./pipelines_source/${OUTPUT_FILE}

cd pipelines_source

git config user.email "cg-ci-bot@cloud.gov"
git config user.name "cg-ci-bot"

if [ ! -z ${NEW_BRANCH} ]; then
    git switch -c ${NEW_BRANCH}
fi

# test for change and commit it, otherwise exit 
CHANGE=$(git status -s)
if [ ! -z "${CHANGE}" ]; then
    git add .
    git commit -a -m "commiting build's resource version data"
fi