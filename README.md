# 🐳 Node.js App Deployment on Kubernetes (Minikube on AWS EC2)

This project demonstrates deploying a simple Node.js application to a Kubernetes cluster (Minikube) running on a t3a.small EC2 instance (AWS). It includes Dockerization, K8s deployment, NodePort exposure.

---

## 📦 Application

A basic Node.js HTTP server displaying its pod IP:

```js
var http = require('http');
var ip = require('ip');

function onRequest(req, res){
  res.writeHead(200, {'Content-Type':'text/plain'});
  res.end('Hello I am ' + ip.address() + '!');
  console.log('Incoming connection from ' + req.connection.remoteAddress);
}

var server = http.createServer(onRequest).listen(process.env.PORT);
```

## 🚀 Deployment Steps

### 1. Dockerize the Application

```bash
docker build -t froghanabiiii/node-app:v1 .
docker push froghanabiiii/node-app:v1
```

### 2. Deploy to Kubernetes via Minikube

```bash
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### 3. Expose NodePort

The Kubernetes Service is configured as NodePort, exposing the application on port 30080.
With proper EC2 security group settings allowing inbound TCP traffic on port 30080, the service is accessible publicly.

### 4. Now your service can be accessed via:
- http://<EC2_PUBLIC_IP>:30080

## 🧪 Tech Stack
- Node.js

- Docker

- Kubernetes (Minikube)

- AWS EC2

## 👨‍💻 Author
Royston | AWS Certified | Cloud & DevOps Enthusiasm



