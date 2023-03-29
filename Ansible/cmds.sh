#!/usr/bin/env bash


export KUBECONFIG=/var/jenkins_home/workspace/Terraform-linode/Terraform/lke-cluster-config.yaml
kubectl get node
kubectl create secret generic regcred \
--from-file=.dockerconfigjson=/var/jenkins_home/.docker/config.json \
--type=kubernetes.io/dockerconfigjson
export K8S_AUTH_KUBECONFIG=/var/jenkins_home/workspace/Terraform-linode/Terraform/lke-cluster-config.yaml