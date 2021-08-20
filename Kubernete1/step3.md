
<b>ReplicaSet</b>

* ReplicaSets are higher-level abstractions than pod
* Responsible for ensuring that a specified number of exact copies of a given pod are running
* It will create a new pod in place of the one that failed.
* **Not support** rolling upgrade or rollback
---

View nginx pod file
`cat files/nginx-rs.yaml`{{execute "T2"}}

Create pod
`kubectl apply -f files/rs.yaml`{{execute "T2"}}

Get pod and replicaset - watch till start running
`kubectl get pods,rs --watch`{{execute "T2"}}

By default nginx endpoint is accessible only inside pod, login to pod and check the endpoint using curl

Login to POD
```
POD=$(kubectl get pods -l app=nginx-pod -o jsonpath="{.items[0].metadata.name}"); 
echo "Pod Name: $POD"
kubectl exec $POD -it -- /bin/bash
```{{execute "T1"}}

Access endpoint using curl
`curl -I 127.0.0.1`{{execute "T2"}}

Exit pod:
`exit`{{execute "T2"}}

Once pod is deleted it **will** automatically re-created. 
`kubectl delete pods nginx-pod`{{execute "T2"}}

watch new pod instance automatically recreate in its place: 
`kubectl get pods --watch`{{execute "T2"}}


Cleanup:
`kubectl delete -f files/nginx-rs.yaml`{{execute "T2"}}
 