
<b>Setup</b>

* 2 node kubernete cluster with kubeadm
---

## controlplane

Remove NoSchedule taint from controlplane so that it will participate in scheduling

Check if tainted
`kubectl get node -o custom-columns=NAME:.metadata.name,TAINT:.spec.taints[*].effect`{{execute "HOST1"}}`

Remove NoSchedule taint
`kubectl taint nodes $(hostname) node-role.kubernetes.io/master:NoSchedule-`{{execute "HOST1"}}

Check again
`kubectl get node -o custom-columns=NAME:.metadata.name,TAINT:.spec.taints[*].effect`{{execute "HOST1"}}`

copy kubeconfig to node01
`scp /etc/kubernetes/admin.conf root@node01:/etc/kubernetes/`{{execute "HOST1"}}

# Node01

Open 'node01' in new tab
`echo open T2 for node01`{{execute T2}}

SSH to 'node01'
`ssh root@node01`{{execute T2}}

Setup kubenete config: 
`export KUBECONFIG=/etc/kubernetes/admin.conf`{{execute "T2"}}


```bash
mkdir files

cd files

wget -q https://raw.githubusercontent.com/mimaya/katacoda-scenarios/master/Kubernete1/files/objects/nginx-pod.yaml

wget -q https://raw.githubusercontent.com/mimaya/katacoda-scenarios/master/Kubernete1/files/objects/nginx-rs.yaml

wget -q https://raw.githubusercontent.com/mimaya/katacoda-scenarios/master/Kubernete1/files/objects/nginx-dep.yaml

wget -q https://raw.githubusercontent.com/mimaya/katacoda-scenarios/master/Kubernete1/files/objects/nginx-latest-dep.yaml

wget -q https://raw.githubusercontent.com/mimaya/katacoda-scenarios/master/Kubernete1/files/objects/svc-clusterip.yaml

wget -q https://raw.githubusercontent.com/mimaya/katacoda-scenarios/master/Kubernete1/files/objects/svc-nodeport.yaml

wget -q https://raw.githubusercontent.com/mimaya/katacoda-scenarios/master/Kubernete1/files/objects/svc-loadbalancer.yaml

wget -q https://raw.githubusercontent.com/mimaya/katacoda-scenarios/master/Kubernete1/files/objects/svc-ingress-nginxi-ingress.yaml

wget -q https://raw.githubusercontent.com/mimaya/katacoda-scenarios/master/Kubernete1/files/objects/svc-ingress.yaml
cd ..
```{{execute "T2"}}


