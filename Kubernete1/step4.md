
<b>Deployment</b>

* One step higher in the abstraction hierarchy
* deployments control both ReplicaSets and pods in a declarative manner
* **Support** rolling upgrade or rollback
---

View yaml file
`cat files/nginx-dep.yaml`{{execute "T2"}}

Create Deployment
`kubectl apply -f files/rs.yaml`{{execute "T2"}}

Get deployment, pod, replicaset - watch till start running
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
`kubectl delete -f files/nginx-dep.yaml`{{execute "T2"}}
 