Klipper Service Load Balancer
=================

This is the runtime image for the integrated service load balancer in klipper. This
works by using a host port for each service load balancer and setting up
iptables to forward the request to the cluster IP. The regular k8s scheduler will
find a free host port. If there are no free host ports, the service load balancer
will stay in pending.

## Building

`make`

## Using

* Load the `DaemonSet` manifest in the Kubernetes cluster:
  ```shell script
  kubectl apply -f https://raw.githubusercontent.com/inercia/klipper-lb/master/klipper.yaml
  ```
* Set the destination for the load balancer be either setting the DNS name or the serfvice IP,
  like
  ```shell script
  kubectl set env daemonset -n kube-system svclb-klipper DEST_ADDR="ambassador.ambassador"
  kubectl rollout restart -n kube-system daemonset svclb-klipper
  ```
  (assuming you `ambassador` service  will be installed in the `ambassador` namespace).
* Install your Ingress, in this example, Ambassador.
  Following [these instructions](https://www.getambassador.io/user-guide/install/),
  installing with
  ```shell script
  edgectl install
  ```
* At this moment, you can access any node in your cluster at port 80 or 443 and it will
  take you to your Ingress.
