
<b>Service: ConfigMap</b>

*

---

View yaml file: 
`cat files/configmap1.yaml`{{execute "T2"}}
`cat files/configmap1-pod.yaml`{{execute "T2"}}

Create configMap 
`kubectl apply -f files/configmap1.yaml`{{execute "T2"}}

Get ConfigMap
`kubectl get cm`{{execute "T2"}}

run busybox pod printing all env
`kubectl create -f files/configmap1-pod.yaml`{{execute "T2"}}

See the output in logs
`kubectl logs configmap-ex1-pod | grep "CM_EX1"`{{execute "T2"}}

Exit pod:
`exit`{{execute "T2"}}


Cleanup:
```
kubectl delete -f files/configmap1.yaml
kubectl delete -f files/configmap1-pod.yaml
```{{execute "T2"}}

