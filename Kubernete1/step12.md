
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


Create PV with storageclass: pv-demo and size: 100MB
`kubectl apply -f files/vol1-hostfile-pv.yaml`{{execute "T2"}}

Check PV is available
`kubectl get pv  my-persistent-volume --watch`{{execute "T2"}}


Create PVC with storageclass: pv-demo and size: 10MB
`kubectl apply -f files/vol1-hostfile-pvc.yaml`{{execute "T2"}}

Check if PV is bounded to requested PVC
`kubectl get pvc my-persistent-volumeclaim --watch`{{execute "T2"}}



create a pod that create a file in mounted dir
`kubectl apply -f files/vol1-hostfile-pod.yaml`{{execute "T2"}}

Check if Pod is competed
`kubectl get pod myvolumes-pod --watch`{{execute "T2"}}

Login to pod
`kubectl exec myvolumes-pod -i -t -- /bin/sh`{{execute "T2"}}

List monted dir
```
touch /my-pv-path/podData.txt
echo "`date`: This line is added by pod " >> /my-pv-path/persistent-file

```{{execute "T2"}}


Exit POD
`exit`{{execute "T2"}}

Get pod node: 
```
podNode=$(kubectl get pod myvolumes-pod -o jsonpath="{.spec.nodeName}")
echo "PodNode : $podNode"
```{{execute "T2"}}

SSH to pod node
`ssh root@$podNode`{{execute "T2"}}



cat file from podNode
`cat /mnt/persistent-volume/podData.txt`{{execute "T2"}}

exit from podNode
`exit`{{execute "T2"}}

 
Cleanup:
```
kubectl delete -f files/vol1-hostfile-pod.yaml
kubectl delete -f files/vol1-hostfile-pvc.yaml
kubectl delete -f files/vol1-hostfile-pv.yaml
```{{execute "T2"}}





controlplane $ pwd
/root
controlplane $ kubectl apply -f files/vol1-hostfile-pv.yaml
persistentvolume/my-persistent-volume created
controlplane $ kubectl get pv  my-persistent-volume --watch
NAME                   CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM   STORAGECLASS   REASON   AGE
my-persistent-volume   100Mi      RWO            Retain           Available           pv-demo                 3s
kubectl apply -f files/vol1-hostfile-pvc.yaml
^Ccontrolplane $ kubectl apply -f files/vol1-hostfile-pvc.yaml
persistentvolumeclaim/my-persistent-volumeclaim created
controlplane $ kubectl get pvc my-persistent-volumeclaim --watch
NAME                        STATUS   VOLUME                 CAPACITY   ACCESS MODES   STORAGECLASS   AGE
my-persistent-volumeclaim   Bound    my-persistent-volume   100Mi      RWO            pv-demo        2s
^Ccontrolplane $ kubectl apply -f files/vol1-hostfile-pod.yaml
pod/myvolumes-pod created
controlplane $ kubectl get pod myvolumes-pod --watch
NAME            READY   STATUS    RESTARTS   AGE
myvolumes-pod   1/1     Running   0          3s
^Ccontrolplane $ kubectl get pod myvolumes-pod -o wide
NAME            READY   STATUS    RESTARTS   AGE   IP            NODE     NOMINATED NODE   READINESS GATES
myvolumes-pod   1/1     Running   0          15s   10.32.0.193   node01   <none>           <none>
controlplane $ kubectl exec myvolumes-pod -i -t -- /bin/sh
/ # echo "`date`: line added by pod " > /my-pv-path/pdata.txt
/ # exit

controlplane $ kubectl get pod myvolumes-pod -o jsonpath="{.spec}"
map[containers:[map[command:[sh -c echo Container 1 is Running ; sleep 3600] image:alpine imagePullPolicy:IfNotPresent name:myvolumes-container resources:map[] terminationMessagePath:/dev/termination-log terminationMessagePolicy:File volumeMounts:[map[mountPath:/my-pv-path name:my-persistent-volumeclaim-name] map[mountPath:/var/run/secrets/kubernetes.io/serviceaccount name:default-token-8rr5t readOnly:true]]]] dnsPolicy:ClusterFirst enableServiceLinks:true nodeName:node01 priority:0 restartPolicy:Always schedulerName:default-scheduler securityContext:map[] serviceAccount:default serviceAccountName:default terminationGracePeriodSeconds:30 tolerations:[map[effect:NoExecute key:node.kubernetes.io/not-ready operator:Exists tolerationSeconds:300] map[effect:NoExecute key:node.kubernetes.io/unreachable operator:Exists tolerationSeconds:300]] volumes:[map[name:my-persistent-volumeclaim-name persistentVolumeClaim:map[claimName:my-persistent-volumeclaim]] map[name:default-token-8rr5t secret:map[defaultMode:420 secretName:default-token-8rr5t]]]]controlplane $ kubectl get pod myvolumes-pod -o jsonpath="{.spec.nodeName}"
node01controlplane $ podNode = $(kubectl get pod myvolumes-pod -o jsonpath="{.spec.nodeName}")
podNode: command not found
controlplane $ podNode=$(kubectl get pod myvolumes-pod -o jsonpath="{.spec.nodeName}")
controlplane $ ssh $podNode
node01 $ cat /mnt/persistent-volume/pdata.txt 
Sun Aug 22 08:34:07 UTC 2021: line added by pod 