echo "*********Start Check********"
ls

echo "*******. Check docker  ********"
export docker=/usr/local/bin/docker
docker version

echo "*******. Check node  ********"
echo $GIT_COMMIT
