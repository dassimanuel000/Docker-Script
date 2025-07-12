VERSION=1.0.0-dev
REPOSITORY=localhost:5050/estoryc-web
IMAGE_TAG=$REPOSITORY:$VERSION
APP_BUILD_ID=1
IS_PROD=0
IS_STAGING=0
PROJECTID=none
for COMMAND in "$@"
do
  case "${COMMAND}"
  in
    "staging")
      APP_BUILD_ID=1
      VERSION=1.0.$APP_BUILD_ID
      PROJECTID=zmooz-dev
      SERVICE_NAME=media-background-remover-staging
      REPOSITORY=eu.gcr.io/$PROJECTID/$SERVICE_NAME
      IMAGE_TAG=$REPOSITORY:$VERSION
      IS_STAGING=1
    ;;
    "prod")
      APP_BUILD_ID=1
      IS_PROD=1
      VERSION=2.0.$APP_BUILD_ID
      PROJECTID=glossy-essence-248121
      SERVICE_NAME=media-background-remover-prod
      REPOSITORY=eu.gcr.io/$PROJECTID/$SERVICE_NAME
      IMAGE_TAG=$REPOSITORY:$VERSION
    ;;
    "removeall")
      docker images -a |  grep $PROJECTID | awk '{print $3}' | xargs docker rmi
      ;;
    "build-base")
      echo BUILD IMAGE: $IMAGE_TAG
      docker build --no-cache \
            -f Dockerfile.base -t $IMAGE_TAG .
    ;;
    "build")
      echo BUILD IMAGE: $IMAGE_TAG
      docker build \
            --build-arg APP_BUILD_ID=$APP_BUILD_ID \
            -f Dockerfile -t $IMAGE_TAG .
    ;;
    "push")
      docker push $REPOSITORY:$VERSION
    ;;
    "deploy")
      echo "update project:" $PROJECTID

  esac
done
echo DONE AND DONE
