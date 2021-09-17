

## Components

![image info](https://raw.githubusercontent.com/mimaya/katacoda-scenarios/master/Kubernete1/files/kuberneteComponents.png)




### Master/ Worker node 
- A Kubernetes cluster is made of masters and nodes. These are Linux hosts that can be 
    * Virtual machines (VM)
    * Bare metal servers in your data center
    * Instances in a private or public cloud.

### API server:
- The API server is the front end for the Kubernetes control plane
- kubectl (agent), Kubectl, RestAPI conmmunicate to control plane through API server
- It exposes a RESTful API that you POST YAML configuration files to change desire state of object
- All requests to the API Server are subject to authentication and authorization checks

### Cluster store / etcd
- It persiste the configuration and state of the cluster
- etcd prefers consistency over availability.
- It can be configured to have multiple copies (replicas) of it for high availability
- This means that it will not tolerate a split-brain situation and will halt updates to the cluster in order to maintain consistency

### Controller manager

- Controller run control loops that monitor the cluster and respond to events.

- Some of the control loops include the node controller, the endpoint controller, and the ReplicaSet controller. 

- Each one runs as a background watch loop that is constantly watching the API server for changes

- Each control loop is also extremely specialized and only interested in its own little corner of the Kubernetes cluster

- Eg: ReplicaSet Controller , runs control loop and check if current number of replicas are same as desired number of replicas. 

- Clontroller Manager is a controller of all controllers

- The logic implemented by each control loop is effectively this:
    * Obtain desired state
    * Observe current state
    * Determine differences
    * Reconcile differences

### Scheduler:

- Scheduler watches the API server for new work tasks and assigns them to the appropriate healthy nodes
- it implements complex logic that filters out nodes incapable of running the task and then ranks the nodes that are capable

### Worker Node:

- Watch the API Server for new work assignments
- Execute new work assignments.
- Report back to the control plane (via the API server).
- Each node run a agent called **KUBELET**. It is resposible for watching the API server for new work assignments

- Each node also run **KUBEPROXY**. It is responsible for cluster networking.

### Kube-proxy

- runs on every node in the cluster
- responsible for local cluster networking
- it makes sure each node gets its own unique IP address and implements local IPTABLES 


### Container runtime

- container runtime perform container-related tasks – things like pulling images and starting and stopping containers.
- Container runtime support different container like (Docker, Containerd) using plugin model called CRI - Container runtime interface.


## How to run application in Kubernete

- Write the application as small independent microservices in our favorite languages.
- Package each microservice in its own container (docker or any other container).
- Kubernetes likes to manage applications declaratively using yaml file. Create a yaml file for your deployement and deploy  
    - Wrap each container in its own Pod.
    - Deploy pods to the cluster directly (as pod) or via higher level controllers like (Deployments, DeamonSets, StatefulSets, CronJobs etc.
    - Sample:
```yaml
        # 1. API Version.
        apiVersion: apps/v1
        
        # 2. Kind : Type of Object. This will have object types like Pod, ReplicaSet, Deployment, Services, etc
        kind: Deployment

        # 3. Metadata: Helps uniquely identify the object. This will have fields like name, UID, namespace, etc
        metadata:
          name: nginx-deployment
          
        # 4. Spec : This will have desired state of the object. Object controller will try to maintain state of the object same as desired state       
        spec:
          selector:
            matchLabels:
              app: nginx-pod
          replicas: 2
          template:  
            metadata:
              name: nginx-pod
              labels:
                app: nginx-pod
            spec:
              containers:
              - name: nginx
                image: nginx:stable
                ports:
                - name: nginx-http-port
                  containerPort: 80
                  protocol: TCP 
``` 
    


## Pods

- A pod is the smallest deployable unit of an application in Kubernetes
- Pod is not same as container
- Each pod can run one or more containers
- All containers running in a same pod share all system resources like
  * IP address
  * Network Port range
  * IPC space
  * Volumes

- Container running in pod can talk to each other using localhost
- Pods are **ephemeral** , Pod can die or terminate and start new one by kubernete


## ReplicaSets

- ReplicaSet is one level above PODs in its hierarchy
- It controls pods 
- Replica set has a defined number of pods that needs to be running, If one of the pods fails or dies, the replication controller will start a new pod in its place
- It is responsible for ensuring that a specified number of copies of a given pod are running 


## Deployment

- Deployment sits above a replica set and can manipulate them
- Container image can not be upgraded (eg: Nginx:1.20 -> 1.23) or rollbacked with out downtime, if deployed using Pod or ReplicaSet 
- Deployment controller does it in rolling fashion


## Services

- Service provide connectivity to pod from outside world, expose endpoint running in pod to outside world
- Service is a network abstraction over a set of pods
- This allows for the traffic to be load balanced for failures

**Types**
  - ClusterIP:
     * Helps to expose a endpoit to all pods rinning in the cluster.
     * Pod A run mongoDB, Pod B run application,  pod B can access mongoDB endpoint running on pod A, if exposed using cluster IP
  - NodePort
     * Cluster IP is accesible with in cluster
     * This can not be accessed from the node running the pod
     * Each node in the cluster will expose a port with same number that will be forwared to clusterIP
  - Loadbalancer
   




