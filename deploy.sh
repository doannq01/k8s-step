echo "***. Deploy ***"

/usr/local/bin/docker run -d -p 5000:80 image:$GIT_COMMIT
