#!/usr/bin/env bash

set -eo pipefail

BUILD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "${BUILD_DIR}")";

# create directories
#mkdir -p  "${PROJECT_DIR}"/var/log var/cache
#chmod 777 "${PROJECT_DIR}"/var/log var/cache

IMAGE="composer"
TAG="2.1.8"

docker run --rm -i -t \
    -v "${PROJECT_DIR}":/app \
    --entrypoint="/bin/bash" \
    "${IMAGE}:${TAG}" \
    -c "composer install --prefer-dist --no-progress --no-interaction --no-suggest --optimize-autoloader"
