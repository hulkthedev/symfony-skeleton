#!/usr/bin/env bash

set -eo pipefail

BUILD_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
PROJECT_DIR="$(dirname "${BUILD_DIR}")";

IMAGE="composer"
TAG="2.1.8"

docker run --rm -i -t \
    -v "${PROJECT_DIR}":/app \
    --user "$(id -u)":"$(id -g)" \
    --entrypoint="/bin/bash" \
    "${IMAGE}:${TAG}" \
    -c "composer install --prefer-dist --no-progress --no-interaction --optimize-autoloader"
