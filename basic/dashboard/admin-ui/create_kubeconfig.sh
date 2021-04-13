#!/usr/bin/env bash

cluster_server="https://192.168.23.11:6443"
cluster_name=mycluser
username=admin
usertoken=`cat usertoken`
config_file=/tmp/admin.kubeconfig
# set cluster
kubectl config set-cluster $cluster_name  --server=$cluster_server  \
        --certificate-authority=/etc/kubernetes/pki/ca.cert \
        --kubeconfig=$config_file
# set credentials
kubectl config  set-credentials $username --token=$usertoken \
                --kubeconfig=$config_file
# set context
kubectl config  set-context $username@$cluster_name --cluster=$cluster_name \
        --user=$username --namespace=kube-system \
        --kubeconfig=$config_file
# use contex
kubectl config use-context $username@$cluster_name --kubeconfig=$config_file
