#!/usr/bin/env bash

# Bash script to easily migrate a Gitlab repo to Github
# Usage: gitlab_to_github.sh ${GITLAB_REPO} ${GITHUB_REPO}

GITLAB_REPO=$1
GITHUB_REPO=$2

if [[ -z ${GITLAB_REPO} ]] || [[ -z ${GITHUB_REPO} ]] ;
then
    echo "Usage: gitlab_to_github.sh GITLAB_REPO GITHUB_REPO"
    exit 1
fi

GITLAB_DIR=$(echo ${GITLAB_REPO} | cut -d "/" -f 3)
echo $GITLAB_DIR

git clone --mirror ${GITLAB_REPO}

cd ${GITLAB_DIR}

git push --no-verify --mirror ${GITHUB_REPO}

