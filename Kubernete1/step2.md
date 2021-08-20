
<b>Pod</b>

* Smallest deployable units 
* Run one or more container
* Each Pod has its own IP address and shares a PID namespace, network, and host name.
* Pod is ephemeral by nature
---

View nginx pod file
`cat files/nginx-pod.yaml`{{execute "T2"}}

Create pod
`kubectl apply -f files/nginx-pod.yaml`{{execute "T2"}}

Get pod - watch till start running
`kubectl get pods --watch`{{execute "T2"}}

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

Once pod is deleted it will not automatically re-created. 
`kubectl delete pods nginx-pod`{{execute "T2"}}

watch Pod: 
`kubectl get pods --watch`{{execute "T2"}}


Cleanup:
`kubectl delete -f files/nginx-pod.yaml`{{execute "T2"}}
 