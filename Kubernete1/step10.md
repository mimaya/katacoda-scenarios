
<b>Service: Secret</b>

* Similar to configMap but stores value securely
* secret value can be data or stringdata. data -> base64encoded , string -> plaintext
```yaml
	data:
      username: dXNlcm5hbWU=
```	  
* 
---

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

Exit pod:
`exit`{{execute "T2"}}


Cleanup:
```
kubectl delete -f files/secret1.yaml
kubectl delete -f files/secret1-pod.yaml
```{{execute "T2"}}

