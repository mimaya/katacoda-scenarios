
<b>Storage: Volume</b>

* On-disk files in a container are ephemeral, have a lifetime of a pod
* On-disk files can not share be shared accross pod replicas or with other pods
* Volume abstraction solves both of these problems

---

**emptyDir : **
 - emptyDir volume is first created when a Pod is assigned to a node
 - all containers running in a pod will have read/write access to the volume
 - If a container in a Pod crashes the emptyDir content is unaffected
 - Deleting a Pod deletes all its emptyDirs
 
 create pod with 
 - initcontainer that create index.html in /usr/share/nginx/html dir in empty volume
 - initcontainer destroyed after completed
 - container run nginx http server and loads files from /usr/share/nginx/html dir in empty volume
 
 
 
 
	


View yaml file: 
`cat files/secret1.yaml`{{execute "T2"}}

`cat files/secret1-pod.yaml`{{execute "T2"}}

Create Secret 
`kubectl apply -f files/secret1.yaml`{{execute "T2"}}

Get Secret
`kubectl get secrets`{{execute "T2"}}

run busybox pod takes secrets as env and print
`kubectl apply -f files/secret1-pod.yaml`{{execute "T2"}}

wait for pod to get completed. (CTL+C to break)
`kubectl get pods  secret1-pod --watch `{{execute "T2"}}

See the output in logs
`kubectl logs secret1-pod | grep "SECRET_"`{{execute "T2"}}

Cleanup:
```
kubectl delete -f files/secret1.yaml
kubectl delete -f files/secret1-pod.yaml
```{{execute "T2"}}

