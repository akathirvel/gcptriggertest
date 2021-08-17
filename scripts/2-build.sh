#!/bin/bash -x
DOCKERFILE=/workspace/src/devops/DockerfileFirebase
BRANCH="BRANCH"

echo -e "building branch $BRANCH with env vars:\n$(cat /workspace/src/devops/_docker-build-env)"
echo "---"

docker build -t tmp-builder-image -f $DOCKERFILE /workspace/src
docker run --mount type=bind,source=/workspace/src,target=/workspace/src  --workdir=/workspace/src  --env-file /workspace/src/devops/_docker-build-env tmp-builder-image
