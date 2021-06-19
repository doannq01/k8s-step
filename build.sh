echo "*********Start Check********"
ls

echo "*******. Check docker  ********"
/usr/local/bin/docker version

echo "*******. Check node  ********"
echo $GIT_COMMIT

echo "***. Build Image  ***"

/usr/local/bin/docker build -t image:$GIT_COMMIT .

/usr/local/bin/docker image ls
