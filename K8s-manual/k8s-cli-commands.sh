#& Cluster Management
# kubectl version                           #~ Display the Kubernetes version
# kubectl cluster-info                      #~ Display cluster information
# kubectl get nodes                         #~ List all nodes in the cluster
# kubectl describe node <node-name>         #~ Describe a specific node
# kubectl top node <node-name>              #~ Display resource usage of a node

#& Namespace Management
# kubectl get namespaces                    #~ List all namespaces
# kubectl create namespace <namespace>      #~ Create a new namespace
# kubectl delete namespace <namespace>      #~ Delete a namespace

#& Pod Management
# kubectl get pods                          #~ List all pods in the current namespace
# kubectl get pods -n <namespace>           #~ List all pods in a specific namespace
# kubectl get pods -o wide                  #~ List all pods with additional details
# kubectl describe pod <pod-name>           #~ Describe a specific pod
# kubectl logs <pod-name>                   #~ Display logs of a pod
# kubectl exec -it <pod-name> -- /bin/bash  #~ Run a command in a pod
# kubectl delete pod <pod-name>             #~ Delete a pod

#& Deployment Management
# kubectl get deployments                   #~ List all deployments
# kubectl create deployment <name> --image=<image>  #~ Create a new deployment
# kubectl describe deployment <name>        #~ Describe a specific deployment
# kubectl scale deployment <name> --replicas=<count>  #~ Scale a deployment
# kubectl delete deployment <name>          #~ Delete a deployment

#& Service Management
# kubectl get services                      #~ List all services
# kubectl expose deployment <name> --port=<port> --type=<type>  #~ Create a new service
# kubectl describe service <name>           #~ Describe a specific service
# kubectl delete service <name>             #~ Delete a service

#& ConfigMap Management
# kubectl get configmaps                    #~ List all ConfigMaps
# kubectl create configmap <name> --from-file=<path>  #~ Create a ConfigMap from a file
# kubectl describe configmap <name>         #~ Describe a specific ConfigMap
# kubectl delete configmap <name>           #~ Delete a ConfigMap

#& Secret Management
# kubectl get secrets                       #~ List all Secrets
# kubectl create secret generic <name> --from-literal=<key>=<value>  #~ Create a Secret
# kubectl describe secret <name>            #~ Describe a specific Secret
# kubectl delete secret <name>              #~ Delete a Secret

#& Ingress Management
# kubectl get ingress                       #~ List all Ingress resources
# kubectl create ingress <name> --rule="<host>/<path>=<service>:<port>"  #~ Create an Ingress
# kubectl describe ingress <name>           #~ Describe a specific Ingress
# kubectl delete ingress <name>             #~ Delete an Ingress

#& Horizontal Pod Autoscaler (HPA)
# kubectl get hpa                           #~ List all HPA resources
# kubectl autoscale deployment <name> --min=<min> --max=<max> --cpu-percent=<cpu>  #~ Create an HPA
# kubectl describe hpa <name>               #~ Describe a specific HPA
# kubectl delete hpa <name>                 #~ Delete an HPA

#& Persistent Volume (PV) and Persistent Volume Claim (PVC)
# kubectl get pv                            #~ List all PVs
# kubectl get pvc                           #~ List all PVCs
# kubectl create -f <pv-config.yaml>        #~ Create a PV from a YAML file
# kubectl create -f <pvc-config.yaml>       #~ Create a PVC from a YAML file
# kubectl delete pv <name>                  #~ Delete a PV
# kubectl delete pvc <name>                 #~ Delete a PVC

#& Kubectl Configuration
# kubectl config view                       #~ View the current kubectl configuration
# kubectl config use-context <context>      #~ Switch to a different context
# kubectl config set-context <context> --namespace=<namespace>  #~ Set the default namespace for a context

#& Troubleshooting
# kubectl logs <pod-name>                   #~ Display logs of a pod
# kubectl describe pod <pod-name>           #~ Describe a specific pod
# kubectl exec -it <pod-name> -- /bin/bash  #~ Run a command in a pod
# kubectl get events                        #~ List recent events in the cluster
# kubectl top pod <pod-name>                #~ Display resource usage of a pod

#& YAML Configuration
#& Create resources from a YAML file
# kubectl apply -f <config.yaml>            #~ Create or update resources defined in a YAML file
# kubectl delete -f <config.yaml>           #~ Delete resources defined in a YAML file

#& Debugging
# kubectl run -i --tty --image=<image> <name> --restart=Never -- /bin/bash  #~ Run a pod for debugging
# kubectl port-forward <pod-name> <local-port>:<pod-port>  #~ Forward a local port to a pod



#& Etcd Backup Commands

#?First save the backup from etcd
# sudo  ETCDCTL_API=3 etcdctl snapshot save --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key [location_where_to_store]

#?Then restore the backup to the hostfile path where etcd stores it data 
# sudo ETCDCTL_API=3 etcdctl snapshot restore [location where backup saved] --endpoints=https://127.0.0.1:2379 --cacert=/etc/kubernetes/pki/etcd/ca.crt --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key --name=kubeadm-master --data-dir=[/var/lib/etcd -> where etcd stores backup but change the name etcd from etcd-backup as the directory was already there]