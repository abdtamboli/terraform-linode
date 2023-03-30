#!/usr/bin/env bash

export KUBECONFIG=/var/jenkins_home/workspace/Terraform-linode/Terraform/lke-cluster-config.yaml
kubectl get node
kubectl get pod -n my-app