
<b>Storage: PersistentVolume and PersistentVolumeClaim</b>

* On-disk files in a container are ephemeral, have a lifetime of a pod
* On-disk files can not share be shared accross pod replicas or with other pods
* Volume abstraction solves both of these problems

---

**PersistentVolume and PersistentVolumeClaim : **
 - emptyDir get deleted when pod is deleted
 - if you need persistent file then PersistentVolume and PersistentVolumeClaim has to be used

**PersistentVolume (PV)**
 - PersistentVolume is also a resource like node in cluster
 - Administrator will add this to cluster
 - provisioning of volume can be automated using storageclass
 
**PersistentVolumeClaim (PVC)** 
 - PersistentVolumeClaim is a request for storage by a user/developer
 - Similar to pod consume node resource, PVC consume PV
 - Pods can request specific levels of resources (CPU and Memory)
 - PV claim can request specific size and access modes (e.g., they can be mounted ReadWriteOnce, ReadOnlyMany or ReadWriteMany, see AccessModes).
 - after claim is released, it can be Retained/ Recycled/ Deleted based on 'reclaim policy'
 
Note: we use PV type 'hostPath' as we don't have any cloud storage. This can not be used in production as pod can be bounded to different nodes. This is only for demo

View PV yaml file: 
`cat  files/vol1-hostfile-pv.yaml`{{execute "T2"}} 

View PVC yaml file: 
`cat  files/vol1-hostfile-pvc.yaml`{{execute "T2"}} 

View POD yaml file: 
`cat  files/vol1-hostfile-pod.yaml`{{execute "T2"}} 


Note:
- PV can use "storageClassName: pv-demo" attribute 
- A PV of a particular class can only be bound to PVCs requesting that class
- If PVC request with no storage class then only PV with no storage class can be available

Create local directory "/mnt/local-pv"
```
mkdir /mnt/persistent-volume

echo persistent data >  /mnt/persistent-volume/persistent-file
```{{execute "T2"}}

Create PV with storageclass: pv-demo and size: 2BG
`kubectl apply -f files/vol1-hostfile-pv.yaml`{{execute "T2"}}

Check PV is available
`kubectl get pv  vol1-hostfile-pv --watch`{{execute "T2"}}


Create PVC with storageclass: pv-demo and size: 2BG
`kubectl apply -f files/vol1-hostfile-pvc.yaml`{{execute "T2"}}

Check if PV is bounded to requested PVC
`kubectl get pvc vol1-hostfile-pvc --watch`{{execute "T2"}}



create a pod that create a file in mounted dir
`kubectl apply -f files/vol1-hostfile-pod.yaml`{{execute "T2"}}

Check if PD is competed
`kubectl get pod vol1-hostfile-pod --watch`{{execute "T2"}}

Login to pod
`kubectl exec vol1-hostfile-pod -it -- /bin/sh`{{execute "T2"}}

List monted dir
`ls /my-pv-path/`{{execute "T2"}}

Create new file in monted dir
`echo "Pod Created file" > /my-pv-path/podCreatedFile.txt`{{execute "T2"}}

Exit POD
`exit`{{execute "T2"}}

check if file created by pod exist in node
`ls /mnt/persistent-volume/`{{execute "T2"}}


cat file
`cat /mnt/persistent-volume/podCreatedFile.txt`{{execute "T2"}}

 
Cleanup:
```
kubectl delete -f files/vol1-hostfile-pod.yaml
kubectl delete -f files/vol1-hostfile-pvc.yaml
kubectl delete -f files/vol1-hostfile-pv.yaml
```{{execute "T2"}}

