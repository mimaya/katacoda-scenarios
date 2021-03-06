
<b>Service: ConfigMap</b>

* Different env like Dev, QA, Proad may have different config
* Use ConfigMap to seprate application code from configuration
* ConfigMap data can be passed to pod through ENV or volume file

---

**Create Config data Map **

View yaml file: 
`cat files/cm1-configdata1.yaml`{{execute}}

Create configMap 
`kubectl apply -f files/cm1-configdata1.yaml`{{execute}}

Describe ConfigMap
`kubectl describe cm cm1-configdata1 `{{execute}}


**Pass to container using volume **

Once the data is available on POD's filesystem. the application running in the pod can load it using its o way.
like nginx load config data from /usr/local/nginx/conf/nginx.conf

View yaml file: 
`cat files/cm1-vol-pod.yaml`{{execute}}

Create POD that takes configMap as file in its volume mount 
`kubectl apply -f files/cm1-vol-pod.yaml`{{execute}}

Wait till pod is up and running
`kubectl get pods cm1-vol-pod --watch`{{execute}}

Login to Pod and view the file in mounted location
`kubectl exec cm1-vol-pod  -it -- /bin/bash`{{execute}}

List the configMap mount dir
`ls /etc/config/`{{execute}}

list config files
`cat /etc/config/game.properties`{{execute}}

list config files
`cat /etc/config/ui.properties`{{execute}}

Exit   
`exit`{{copy}}

**Pass to container using ENV **

View yaml file: 
`cat files/cm1-env-pod.yaml`{{execute}}

Create POD that takes configMap as env 
`kubectl apply -f files/cm1-env-pod.yaml`{{execute}}

Wait till pod is completed
`kubectl get pods cm1-env-pod --watch`{{execute}}

Print pod logs
`kubectl logs cm1-env-pod `{{execute}}


Cleanup:
```
kubectl delete -f files/cm1-vol-pod.yaml
kubectl delete -f files/cm1-env-pod.yaml
kubectl delete -f files/cm1-configdata1.yaml
```{{execute}}

