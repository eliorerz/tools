#!/bin/bash

PYTHON_PRERELEASE_TAG=${PYTHON_PRERELEASE_TAG:-}
OS_RELEASE_TAG=${OS_RELEASE_TAG:-stream9}
BASE_IMAGE_OS=${BASE_IMAGE_OS:-quay.io/centos/centos:"${OS_RELEASE_TAG}"}
PYTHON_VERSION=${PYTHON_VERSION:-3.10.7}


dj --dockerfile Dockerfile.jinja --outfile Dockerfile --env BASE_IMAGE_OS="${BASE_IMAGE_OS}" --env PYTHON_VERSION="${PYTHON_VERSION}" --env PYTHON_PRERELEASE_TAG="${PYTHON_PRERELEASE_TAG}"

IMAGE=quay.io/eerez/python-builder:"${OS_RELEASE_TAG}-${PYTHON_VERSION}${PYTHON_PRERELEASE_TAG}"
docker build . -t "${IMAGE}"
docker push "${IMAGE}"