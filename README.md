# Kubernetes Cluster Setup with Ansible

This repository contains Ansible playbooks and related files for setting up a Kubernetes cluster.

## Prerequisites

Before you begin, ensure you have the following dependencies installed on your Ansible control machine:

- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- SSH Key
- [Python 3](https://www.python.org/downloads/)

## Usage

1. Clone this repository to your Ansible control machine.

   ```bash
   git clone https://github.com/yourusername/kubernetes-ansible.git
   ```

2. Navigate to the repository directory.

   ```bash
   cd kubernetes-ansible
   ```

3. Modify the `hosts.yml` file to specify your target hosts. You can define your Kubernetes master and worker nodes.

4. Run the `install.sh` script to install the cluster with the default configurations. Use the following command to execute it:

   ```bash
   ./install.sh
   ```

   The script will execute the Ansible playbooks to set up the cluster with the default configurations.

5. After the installation is complete, you can check your Kubernetes cluster by using `kubectl`. Ensure you have `kubectl` configured with the appropriate `admin.conf` file. You can copy the `admin.conf` file from the master node to your local machine using the `copy.yml` playbook provided.

## Playbooks

- `copy.yml`: Copies the `admin.conf` file from the master node to the local Ansible host.

- `helm-install.yml`: Installs Helm, a Kubernetes package manager, to facilitate application deployment.

- `ingress-install.yml`: Installs Ingress and Cert-Manager for SSL certificates and routing.

- `kube-install.yml`: Sets up the Kubernetes cluster and installs Docker. It also installs Helm.

- `masters.yml`: Initializes the master node, copies the `admin.conf` file, and installs the Flannel network plugin.

- `users.yml`: Creates an `ubuntu` user with sudo privileges and sets up SSH keys for it.

- `workers.yml`: Gets the join command from the master and uses it to join worker nodes to the cluster.
