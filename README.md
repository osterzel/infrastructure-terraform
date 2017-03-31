# Provision AWS resources with terraform

# Pre-requisites

Creation of an S3 bucket for the state file as defined in your variables or the default in tf/variables.tf
Creation of a DynamoDB table for locking as defined in your variables or the default in tf/variables.tf

These 2 locations setup the initial pieces for centralized locking and storage of the changes to your infrastructure

# Running the infrastructure creation

make provision - This will create or update your aws infrastructure 
make destroy - This will destroy all resources known the the terraform state
