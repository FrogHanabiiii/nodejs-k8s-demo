# 🐳 Node.js App Deployment on Kubernetes (Minikube on AWS EC2)

This project demonstrates deploying a simple Node.js application to a Kubernetes cluster (Minikube) running on a t3a.small EC2 instance (AWS). It includes Dockerization, K8s deployment, NodePort exposure, and public access via `socat` port mapping.

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

## 🚀 Deployment Steps

✅ 1. Dockerize the Application

- docker build -t froghanabiiii/node-app:v1 .
- docker push froghanabiiii/node-app:v1

✅ 2. Deploy to Kubernetes via Minikube

- kubectl apply -f deployment.yaml
- kubectl apply -f service.yaml

✅ 3. Expose NodePort using socat

Since Minikube (Docker driver) runs in a bridge network, NodePort isn’t directly accessible from the internet. To expose it, use socat to bridge a public EC2 port (e.g., 8080) to the Minikube virtual IP and NodePort (e.g., 30080):

- sudo apt install socat
- sudo socat TCP-LISTEN:8080,fork TCP:192.168.49.2:30080

Now your service can be accessed via:
- http://<EC2_PUBLIC_IP>:8080

## 🧪 Tech Stack
- Node.js

- Docker

- Kubernetes (Minikube)

- AWS EC2

- socat

## 👨‍💻 Author
Royston | AWS Certified | Cloud & DevOps Enthusiasm






