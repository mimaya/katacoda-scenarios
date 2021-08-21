
<b>Service: ConfigMap</b>

*

---

View yaml file: 
`cat files/configMap-example1.yaml`{{execute "T2"}}

Create configMap and Pod using the map Controller
`kubectl apply -f files/configMap-example1.yaml`{{execute "T2"}}


Get ConfigMap  
```
kubectl get configmaps 
kubectl get configmaps configmap-ex1
`{{execute "T2"}}

Wait for pod to start running (CTL+C to break)
`kubectl get pods --watch`{{execute "T2"}}

Login to POD
`kubectl exec configmap-ex1-pod -it -- /bin/bash`{{execute "T2"}}

get ENV variables
`env`{{execute "T2"}}

Exit pod:
`exit`{{execute "T2"}}


Cleanup:
`kubectl delete -f files/configMap-example1.yaml`{{execute "T2"}}

