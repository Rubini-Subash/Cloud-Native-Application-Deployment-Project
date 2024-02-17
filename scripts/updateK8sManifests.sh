#!/bin/bash

# Install dos2unix to handle line endings
sudo apt-get install dos2unix -y

# Convert line endings to Unix style
dos2unix scripts/updateK8sManifests.sh

# Set Git user email and name
git config --global user.email <email_address>
git config --global user.name <user_name>

# set -x

# Set the repository URL
REPO_URL=<REPO_URL>

# Clone the git repository into the /tmp directory
git clone "$REPO_URL" /tmp/temp_repo

# Navigate into the cloned repository directory
cd /tmp/temp_repo

# Make changes to the Kubernetes manifest file(s)
# For example, let's say you want to change the image tag in a deployment.yaml file
sed -i "s|image:.*|image: <Acr_Name>\/$2:$3|g" <Yaml_File_Path>

# Add the modified files
git add .

# Commit the changes
git commit -m "Update Kubernetes manifest"

# Push the changes back to the repository
git push

# Cleanup: remove the temporary directory
rm -rf /tmp/temp_repo
