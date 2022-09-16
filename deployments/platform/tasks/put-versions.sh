#!/bin/sh


cp ./versions/resource_versions.yml ./pipelines_source/${OUTPUT_FILE}

cd pipelines_source

git config user.email "cg-ci-bot@cloud.gov"
git config user.name "cg-ci-bot"

if [ ! -z ${NEW_BRANCH} ]; then
    git switch -c ${NEW_BRANCH}
fi

git add .


git commit -a -m "commiting build's resource version data"
