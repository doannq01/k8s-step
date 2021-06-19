echo "***. Deploy ***"
/usr/local/bin/docker container stop k8s_step

/usr/local/bin/docker run -d -p 5000:80 --name k8s_step image:$GIT_COMMIT
