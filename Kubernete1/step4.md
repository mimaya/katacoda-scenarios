
<b>Deployment</b>

* One step higher in the abstraction hierarchy
* deployments control both ReplicaSets and pods in a declarative manner
* **Support** rolling upgrade or rollback
---

View yaml file
`cat files/nginx-dep.yaml`{{execute "T2"}}

Create Deployment
`kubectl apply -f files/nginx-dep.yaml`{{execute "T2"}}

Get Deployment & ReplicaSet
`kubectl get deployment,rs `{{execute "T2"}}

Watch pod start and running (CTL+C to break)
`kubectl get pods --watch`{{execute "T2"}}

By default nginx endpoint is accessible only inside pod, login to pod and check the endpoint using curl

Get Pod Name:
```
POD=$(kubectl get pods -l app=nginx-pod -o jsonpath="{.items[0].metadata.name}")
echo "Pod Name: $POD"
```{{execute "T2"}}

Login to POD
`kubectl exec $POD -it -- /bin/bash`{{execute "T2"}}

Access endpoint using curl
`curl -I 127.0.0.1`{{execute "T2"}}

Exit pod:
`exit`{{execute "T2"}}

Once pod is deleted it **will** automatically re-created. 
`kubectl delete pods $POD & kubectl get pods --watch `{{execute "T2"}}


Rolling upgrade from nginx:stable -> nginx:latest
`kubectl apply -f files/nginx-latest-dep.yaml & kubectl get pods --watch `{{execute "T2"}}

Cleanup:
`kubectl delete -f files/nginx-latest-dep.yaml`{{execute "T2"}}
 