#!/bin/bash

python3 -m pip install docker-jinja3


LATEST_PYTHON_VERSION="3.10.7"
PYTHON_PRERELEASE_TAG=${PYTHON_PRERELEASE_TAG:-""}
OS_RELEASE_TAG=${OS_RELEASE_TAG:-stream9}
BASE_IMAGE_OS=${BASE_IMAGE_OS:-quay.io/centos/centos:"${OS_RELEASE_TAG}"}
PYTHON_VERSION=${PYTHON_VERSION:-"${LATEST_PYTHON_VERSION}"}


if [[ -n ${PYTHON_PRERELEASE_TAG} ]]; then
  dj --dockerfile Dockerfile.jinja --outfile Dockerfile \
   --env BASE_IMAGE_OS="${BASE_IMAGE_OS}" \
   --env PYTHON_VERSION="${PYTHON_VERSION}" \
   --env PYTHON_PRERELEASE_TAG="${PYTHON_PRERELEASE_TAG}"
else
  dj --dockerfile Dockerfile.jinja --outfile Dockerfile \
   --env BASE_IMAGE_OS="${BASE_IMAGE_OS}" \
   --env PYTHON_VERSION="${PYTHON_VERSION}"
fi


IMAGE=quay.io/eerez/python-builder:"${OS_RELEASE_TAG}-${PYTHON_VERSION}${PYTHON_PRERELEASE_TAG}"
docker build . -t "${IMAGE}"
docker push "${IMAGE}"
