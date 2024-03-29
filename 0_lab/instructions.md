
# Installation environnement de Lab Kubernetes

Placez vous dans le répertoire du `0_lab` et exécutez le script `install.sh`.
L’installation devrait prendre maximum 10min; vous pouvez vérifier la bonne installation de l'environement avec les éléments suivants (toujours en se plaçant dans le répertoire : lab)

### on devrait voir 4 VMs en mode running avec la commande : vagrant status

```bash
$ vagrant status
Current machine states:

k8s-master-01             running (virtualbox)
k8s-worker-01             running (virtualbox)
k8s-worker-02             running (virtualbox)
k8s-worker-03             running (virtualbox)

This environment represents multiple VMs. The VMs are all listed
above with their current state. For more information about a specific
VM, run `vagrant status NAME`.
}
```

#  On devrait pouvoir se connecter au Master avec la commande : vagrant ssh k8s-master-01

```bash
$ vagrant ssh k8s-master-01
```

###  On devrait voir les 4 nodes (le master et les 3 worker nodes)

```bash
$ kubectl get node
NAME            STATUS   ROLES           AGE   VERSION
k8s-master-01   Ready    control-plane   74m   v1.27.1
k8s-worker-01   Ready    worker          72m   v1.27.1
k8s-worker-02   Ready    worker          71m   v1.27.1
k8s-worker-03   Ready    worker          69m   v1.27.1
```

#  On devrait voir 18 pods avec le STATUS running et RESTARTS 0

```bash
vagrant@k8s-master-01:~$ kubectl get pods -A
NAMESPACE              NAME                                         READY   STATUS    RESTARTS   AGE
kube-system            calico-kube-controllers-786b679988-dcjrk     1/1     Running   0          105m
kube-system            calico-node-ctsqr                            1/1     Running   0          105m
kube-system            calico-node-n86wf                            1/1     Running   0          100m
kube-system            calico-node-xvxzf                            1/1     Running   0          104m
kube-system            calico-node-z7lgh                            1/1     Running   0          102m
kube-system            coredns-5d78c9869d-h2275                     1/1     Running   0          105m
kube-system            coredns-5d78c9869d-hk9j8                     1/1     Running   0          105m
kube-system            etcd-k8s-master-01                           1/1     Running   0          105m
kube-system            kube-apiserver-k8s-master-01                 1/1     Running   0          105m
kube-system            kube-controller-manager-k8s-master-01        1/1     Running   0          105m
kube-system            kube-proxy-487hg                             1/1     Running   0          100m
kube-system            kube-proxy-n5tb7                             1/1     Running   0          104m
kube-system            kube-proxy-qjc7g                             1/1     Running   0          105m
kube-system            kube-proxy-qxgls                             1/1     Running   0          102m
kube-system            kube-scheduler-k8s-master-01                 1/1     Running   0          105m
kube-system            metrics-server-754586b847-s5vrd              1/1     Running   0          105m
kubernetes-dashboard   dashboard-metrics-scraper-5cb4f4bb9c-k9h9v   1/1     Running   0          100m
kubernetes-dashboard   kubernetes-dashboard-6967859bff-jjf5d        1/1     Running   0          100m
```

### une fois la vérification terminée vous pouvez sortir du shell et arrêter l’environnement

```bash
vagrant@k8s-master-01:~$ exit

$ vagrant halt
==> k8s-worker-03: Attempting graceful shutdown of VM...
==> k8s-worker-02: Attempting graceful shutdown of VM...
==> k8s-worker-01: Attempting graceful shutdown of VM...
==> k8s-master-01: Attempting graceful shutdown of VM...
```
