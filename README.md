# k8s-step
Docker Image

```
#Dockerfile

FROM node:14.15.1 
RUN npm install serve -g 
COPY . .
CMD ["serve", "-p", "80", "-s", "."]
```

```
docker build -t image:tag .
```

```
docker push image:tag
```

Run Docker Container

```
docker run -d -p 8000:80 node-docker
```

```
docker ps
```

```
docker container ls
```

```
-a
```

Run Compose

```
#docker-compose
version: "3.6"
services:
  client:
    image: image:tag
    expose:
      - "5000"
    ports:
      - "5000:80"
    volumes:
```

```
docker-compose -f "provision\docker-compose.yml" up -d
```

Docker Swarm

```
docker run -it --rm \
  --name swarmpit-installer \
  --volume /var/run/docker.sock:/var/run/docker.sock \
swarmpit/install:1.9
```

```
http://localhost:888/
admin
11111111
```

```
version: "3"
services:
  app1:
    image: image:tag
    ports:
      - 8001:80
    networks:
      - client
    logging:
      driver: 'json-file'
      options:
        max-size: '50m'
    networks:
      - client
networks:
  client:
```

```
docker stack deploy -c ./stack.yml l
```

K8S RUN
```

apiVersion: apps/v1
kind: Deployment
metadata:
  name: app-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: app1
  template:
    metadata:
      labels:
        app: app1
    spec:
      containers:
      - name: app-container
        image: image:tag
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: app-service
spec:
  type: NodePort
  ports:
    - port: 80
      targetPort: 80
      protocol: TCP
      nodePort: 31000
  selector:
    app: app1
```

```
=> run localhost:31000
```

```
kubectl expose deployment app-deployment --type=LoadBalancer --port 8001 --target-port 80
=> run localhost: 8001
```

```
---
apiVersion: v1
kind: Service
metadata:
  name: app-service
spec:
  type: LoadBalancer
  ports:
    - port: 8001
      targetPort: 80
      protocol: TCP
  selector:
    app: app1
```

```
version=ba3c8e629ff27807c81c32a910f5a13f66b4e688 envsubst < ~/Documents/working/DoAn/qlct/react-client/k8s.yaml | kubectl apply -f -
```

#delete
```
kubectl delete deployment.apps/node-core
```


---
kubectl get pods

```
#Scale up your application
kubectl scale deployment node-core-github-helm-k8s --replicas=1
```

```
kubectl create deploy node-core --image asia.gcr.io/the-bird-246907/node-core:node_helm_k8s --dry-run -o yaml
```

Check container logs
```
kubectl logs <POD NAME>
```

```
kubectl get pods -o wide --all-namespaces
```

Go inside container
```
kubectl exec -it <POD NAME> bash
```

Delete a whole deployment
```
kubectl delete deployment my-app-deployment
```

Set horizontal pod autoscaling policy for deployment
```
kubectl autoscale deployment <DEPLOYMENT_NAME> --max 6 --min 1 --cpu-percent 60
```

Check pod Events to investigate issues with pods deployment, polling docker image, etc.
```
kubectl get pods
kubectl describe pods/<POD_NAME>
```

```
#public app
kubectl expose deployment node-core --type=LoadBalancer --port 8080 --target-port 8082

kubectl get service
```

```
kubectl apply -f k8s.yaml -n demo
```

---


```
kubectl exec -it app-deployment-7885499ff9-pjm2v bash
```

```
curl localhost:8001
```

```
curl localhost:80
```

```
curl http://nats:4222
```
