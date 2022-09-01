#!/bin/sh


cp ./versions/resource_versions.yml ./pipelines_source/${OUTPUT_FILE}

cd pipelines_source
if [ -n "${SOURCE_BRANCH}"]; then
    git switch -c ${SOURCE_BRANCH}
fi

git commit -a -m "commiting build's resource versions"

