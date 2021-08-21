
<b>Service: NodePort</b>

* ClusterIP can be accessed only from inside pod
* NodePort opens a port on each cluster node.
* NodePort routes to ClusterIP service
* If Node/VM IP address change, you need to deal with that

---

View yaml file: 
`cat files/svc-nodeport.yaml`{{execute "T2"}}

Create nginx Deployment: 
`kubectl apply -f files/nginx-dep.yaml`{{execute "T2"}}

Check if node port is free: 
`netstat -plant | grep 30001`{{execute "T2"}}

Expose NodePort Service: 
`kubectl apply -f files/svc-nodeport.yaml`{{execute "T2"}}

Check if node port is occupied: 
`netstat -plant | grep 30001`{{execute "T2"}}

Display Service info: 
`kubectl get services`{{execute "T2"}}

Run curl from localNode:nodePort 
`curl -I 127.0.0.1:30001`{{execute "T2"}}


Cleanup:
```
kubectl delete -f files/nginx-dep.yaml

kubectl delete -f files/svc-nodeport.yaml
```{{execute "T2"}}


