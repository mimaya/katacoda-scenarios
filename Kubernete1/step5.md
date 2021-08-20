
<b>Service: ClusterIP</b>

* Service is to expose endpoint running in pod to outside world
* ClusterIP expose it to all pods in the cluster

---

View yaml file
`cat files/svc-clusterip.yaml`{{execute "T2"}}

Create Deployment
`kubectl apply -f files/nginx-dep.yaml`{{execute "T2"}}

Create Service
`kubectl apply -f svc-clusterip.yaml`{{execute "T2"}}


Get Deployment & ReplicaSet
`kubectl get deployment,rs `{{execute "T2"}}

Get pod  - watch till start running
`kubectl get pods,rs --watch`{{execute "T2"}}

Get services
`kubectl get services`{{execute "T2"}}


Login to new busybox pod and access endpoint using clusterIP: 
```
CIP=$(kubectl get services nginxsvc-cluster -o jsonpath="{.spec.clusterIP}")

echo ClusterIP : $CIP

kubectl run -i --tty busybox --image=radial/busyboxplus --restart=Never --env="CIP=$CIP

```{{execute "T2"}}


Run curl command: 
`curl -I $CIP:8080`{{execute "T2"}}

Exit busybox pod: 
`exit`{{execute "T2"}}

Cleanup:
```
kubectl delete -f files/nginx-dep.yaml

kubectl delete -f files/svc-clusterip.yaml
```{{execute "T2"}}