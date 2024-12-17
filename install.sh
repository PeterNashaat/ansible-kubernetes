#!/bin/bash

# Set up the Ansible inventory file
INVENTORY_FILE="hosts"
echo "[INFO] Using inventory file: $INVENTORY_FILE"

# Step 1: Install HAProxy on Load Balancer
echo "[INFO] Installing HAProxy Load Balancer..."
ansible-playbook -i $INVENTORY_FILE loadbalancer.yml

# Step 2: Setup Kubernetes Masters
echo "[INFO] Setting up Kubernetes master nodes..."
ansible-playbook -i $INVENTORY_FILE masters.yml

# Step 3: Remove taints from master nodes
echo "[INFO] Removing taints from master nodes..."
ansible-playbook -i $INVENTORY_FILE workers.yml

# Step 4: Copy Kubernetes admin config to local machine
echo "[INFO] Copying Kubernetes admin config to local machine..."
ansible-playbook -i $INVENTORY_FILE copy_config.yml

# Verify Kubernetes cluster
echo "[INFO] Verifying the Kubernetes cluster..."
kubectl get nodes

echo "[SUCCESS] Kubernetes cluster setup is complete!"

