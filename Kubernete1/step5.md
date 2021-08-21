
<b>Service: ClusterIP</b>

* Service is to expose endpoint running in pod to outside world
* ClusterIP expose it to all pods in the cluster
* This is the default ServiceType

---

View yaml file: 
`cat files/svc-clusterip.yaml`{{execute "T2"}}

Create nginx Deployment: 
`kubectl apply -f files/nginx-dep.yaml`{{execute "T2"}}

Expose ClusterIP Service: 
`kubectl apply -f files/svc-clusterip.yaml`{{execute "T2"}}

Display Service info: 
`kubectl get services`{{execute "T2"}}

Get ClusterIP:
```
CIP=$(kubectl get services nginxsvc-cluster -o jsonpath="{.spec.clusterIP}")

echo ClusterIP : $CIP
```{{execute "T2"}}

Login to new busybox pod and access endpoint using clusterIP: 
`kubectl run -i --tty busybox --image=radial/busyboxplus --restart=Never --env="CIP=$CIP"`{{execute "T2"}}


Run curl command: 
```
echo curl -I $CIP:8080
curl -I $CIP:8080
```{{execute "T2"}}

Exit busybox pod: 
`exit`{{execute "T2"}}

Cleanup:
```
kubectl delete -f files/nginx-dep.yaml

kubectl delete -f files/svc-clusterip.yaml
```{{execute "T2"}}