#!/bin/bash

# Check if the cluster domain name argument is provided
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <cluster_domain_name>"
  exit 1
fi

# Get the cluster domain name from the command line argument
cluster_domain="$1"

# Define the list of playbooks to run
playbooks=("users.yml" "kube-install.yml" "masters.yml" "workers.yml" "ingress-install.yml")

# Loop through the playbooks and execute them
for playbook in "${playbooks[@]}"; do
  echo "INSTALLING $playbook"
  ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -i hosts --extra-vars "cluster_domain=$cluster_domain" "$playbook"
done

echo "All playbooks have been executed."
