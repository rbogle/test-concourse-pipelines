#!/bin/sh


cp ./versions/resource_versions.yml ./pipelines_source/${OUTPUT_FILE}

cd pipelines_source

git config user.email "cg-ci-bot@cloud.gov"
git config user.name "cg-ci-bot"

if [ -n "${SOURCE_BRANCH}"]; then
    git switch -c ${SOURCE_BRANCH}
fi

git commit -a -m "commiting build's resource version data"
