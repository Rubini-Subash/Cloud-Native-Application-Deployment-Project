#!/bin/bash

# Install dos2unix to handle line endings
sudo apt-get install dos2unix -y

# Convert line endings to Unix style
dos2unix /path/to/your/script.sh

set -x

# Set the repository URL
REPO_URL="https://u3hnhtr44w2qxfk7zbtkdl44l6q53hvqou6o5gp3aca73omhjtqa@dev.azure.com/ndineshkumar/Main_project/_git/Main_project"

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: myacr0606.azurecr.io\/$2:$3|g" k8s-specifications/$1-deployment.yaml

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo