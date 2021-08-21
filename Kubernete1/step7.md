
<b>Service: Loadbalancer</b>

*

---

View yaml file: 
`cat files/svc-loadbalancer.yaml`{{execute "T2"}}

Create nginx Deployment: 
`kubectl apply -f files/nginx-dep.yaml`{{execute "T2"}}

Create Loadbalancer Service: 
`kubectl apply -f files/svc-loadbalancer.yaml`{{execute "T2"}}

Wait until external IP is assigned: 
`kubectl get services --watch`{{execute "T2"}}

Get External IP: 
```
EIP=$(kubectl get services nginxsvc-lb -o jsonpath="{.status.loadBalancer.ingress[0].ip}")
echo $EIP
```{{execute "T2"}}


Run curl from localNode:nodePort 
`curl -I $EIP:30002`{{execute "T2"}}


Cleanup:
```
kubectl delete -f files/nginx-dep.yaml

kubectl delete -f files/svc-loadbalancer.yaml
```{{execute "T2"}}

