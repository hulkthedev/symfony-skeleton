#!/usr/bin/env bash

set -eo pipefail

THIS_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

COMPOSER_FILE_DIR="/website-skeleton";
if [ "${1}" = "skeleton" ]; then
    COMPOSER_FILE_DIR="/skeleton";
fi

IMAGE="composer"
TAG="2.1.9"

docker run --rm -i -t \
    -v "${THIS_DIR}${COMPOSER_FILE_DIR}":/app \
    --user "$(id -u)":"$(id -g)" \
    --entrypoint="/bin/bash" \
    "${IMAGE}:${TAG}" \
    -c "composer install --prefer-dist --no-progress --no-interaction --optimize-autoloader"
