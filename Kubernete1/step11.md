
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
`cat  files/vol1-emptydir.yaml`{{execute "T2"}} 

Create nginx pod  
`kubectl apply -f files/vol1-emptydir.yaml`{{execute "T2"}}

Check if initialization completed and pod is running 
`kubectl get pods --watch`{{execute "T2"}}

Login to pod
`kubectl exec vol1-emptydir-pod -it -- /bin/bash`{{execute "T2"}}

cat index.html file
`cat /usr/share/nginx/html/index.html `{{execute "T2"}}

Access nginx index.html
`curl http://localhost/index.html`{{execute "T2"}}


exit Pod
`exit`{{execute "T2"}}

 
Cleanup:
```
kubectl delete -f files/vol1-emptydir.yaml
```{{execute "T2"}}

