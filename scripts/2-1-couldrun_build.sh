DOCKERFILE=/workspace/src/devops/DockerfileCloudRun
REPO=$1
BRANCH=$2

echo -e "building branch $BRANCH with env vars:\n$(cat /workspace/src/devops/_docker-build-env)"
echo "---"
REPO2=${REPO,,}
BRANCH2=${BRANCH,,}
docker build -t gcr.io/NextJsProject/$REPO2-$BRANCH2 -f $DOCKERFILE /workspace/src
docker push gcr.io/NextJsProject/$REPO2-$BRANCH2
