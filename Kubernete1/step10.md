
<b>Service: Secret</b>

* Similar to configMap but stores value securely
* secret value can be data or stringdata. data -> base64encoded , string -> plaintext

    data:
      username: dXNlcm5hbWU=
      stringData:
      role: admin
* secret types. opaque is generic type to store any secret fields. other built-in type have pre-defined fields for uniformity

    opaque
	kubernetes.io/service-account-token
	kubernetes.io/basic-auth
	kubernetes.io/ssh-auth
	kubernetes.io/tls
	bootstrap.kubernetes.io/token
	kubernetes.io/dockerconfigjson
	kubernetes.io/dockercfg
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

Cleanup:
```
kubectl delete -f files/secret1.yaml
kubectl delete -f files/secret1-pod.yaml
```{{execute "T2"}}

