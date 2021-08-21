
<b>Service: Ingress</b>

*

---

View yaml file: 
`cat files/svc-ingress.yaml`{{execute "T2"}}

Create 2 hasicrop/echo-server and its clusterIP services: 
```
kubectl run --restart=Never --image hashicorp/http-echo --labels app=echo-server-1 --port 80 echo-server-1 -- -listen=:80 --text="Hello from service-1"

kubectl run --restart=Never --image hashicorp/http-echo --labels app=echo-server-2 --port 80 echo-server-2 -- -listen=:80 --text="Hello from service-2"

kubectl expose pod echo-server-1 --port 80 --target-port 80 --name "echo-service-1"

kubectl expose pod echo-server-2 --port 80 --target-port 80 --name "echo-service-2"
```{{execute "T2"}}

Create nginx-ingress Controller
`kubectl apply -f files/svc-ingress-nginxi-ingress.yaml`{{execute "T2"}}


Create Ingress Service 
`kubectl apply -f files/svc-ingress.yaml`{{execute "T2"}}


Wait until 'ingress-nginx' external IP is assigned: 
`kubectl get services --watch`{{execute "T2"}}

Get External IP: 
```
EIP=$(kubectl get services ingress-nginx -o jsonpath="{.status.loadBalancer.ingress[0].ip}")
echo $EIP
```{{execute "T2"}}

Test ingress end point /echo1 and /echo2
`curl -D - --resolv mysite.com:80:$EIP --insecure http://mysite.com/echo1`{{execute "T2"}}

`curl -D - --resolv mysite.com:80:$EIP --insecure http://mysite.com/echo2`{{execute "T2"}}



Cleanup:
```
kubectl delete deployment echo-server-1
kubectl delete deployment echo-server-2
kubectl delete service echo-service-1
kubectl delete service echo-service-2
kubectl delete -f files/svc-ingress-nginxi-ingress.yaml
kubectl delete -f files/svc-ingress.yaml
```{{execute "T2"}}

