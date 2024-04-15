#!/bin/bash

# Set region (replace with your region)
REGION=<your-region>

# Set project ID (replace with your GCP project ID)
PROJECT_ID=<your-project-id>

# Set image name and tag (replace with yours)
IMAGE_NAME=<your-image-name>
IMAGE_TAG=<tag>

# Create a service account with permissions (refer to GCP documentation)
gcloud iam service-accounts create deployer \
    --project=$PROJECT_ID

# Grant service account permissions to access Artifact Registry
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:deployer@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/artifactregistry.reader"

# Grant service account permissions to create Compute Engine resources
gcloud projects add-iam-policy-binding $PROJECT_ID \
    --member="serviceAccount:deployer@$PROJECT_ID.iam.gserviceaccount.com" \
    --role="roles/compute.admin"

# Authenticate with the service account (replace with path to your key file)
gcloud auth activate-service-account --key-file=deployer.json

# Pull the image from Artifact Registry
gcloud docker --region=$REGION pull \
    <your-project-id>-ar.pkg.dev/<your-region>/<your-repository>:<tag>

# Run the container on the Compute Engine instance
gcloud compute instances add-container vm-name \
    --container-name container-name \
