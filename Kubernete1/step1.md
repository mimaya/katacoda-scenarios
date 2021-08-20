
<b>Setup</b>

* 2 node kubernete cluster with kubeadm
---

## controlplane

* Remove NoSchedule taint from controlplane so that it will participate in scheduling

``` bash
echo Check if tainted
kubectl get node -o custom-columns=NAME:.metadata.name,TAINT:.spec.taints[*].effect

echo Remove NoSchedule taint
kubectl taint nodes $(hostname) node-role.kubernetes.io/master:NoSchedule-

echo Check again
kubectl get node -o custom-columns=NAME:.metadata.name,TAINT:.spec.taints[*].effect

echo copy kubeconfig to node01
scp /etc/kubernetes/admin.conf root@node01:/etc/kubernetes/
```{{execute "HOST1"}}

# Node01

* Open 'node01' in new tab
`echo open T2 for node01`{{execute T2}}
`ssh root@node01`{{execute T2}}

* copy KubeConfig from controlplane
`scp /etc/kubernetes/admin.conf root@node01:/etc/kubernetes/`{{execute "HOST1"}}

* create files dir
mkdir files
`ssh root@node01`{{execute T2}}

``



