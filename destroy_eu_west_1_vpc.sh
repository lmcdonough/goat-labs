#!/bin/bash

# Set the AWS region
AWS_REGION="eu-west-1"

# Function to delete EC2 instances
delete_ec2_instances() {
  instance_ids=$(aws ec2 describe-instances --region $AWS_REGION --query 'Reservations[*].Instances[*].InstanceId' --output text)
  if [ ! -z "$instance_ids" ]; then
    aws ec2 terminate-instances --instance-ids $instance_ids --region $AWS_REGION
  fi
}

# Function to delete S3 buckets
delete_s3_buckets() {
  buckets=$(aws s3 ls s3:// --region $AWS_REGION | awk '{print $3}')
  if [ ! -z "$buckets" ]; then
    for bucket in $buckets; do
      aws s3 rb s3://$bucket --force --region $AWS_REGION
    done
  fi
}

# Function to delete RDS instances
delete_rds_instances() {
  db_instance_ids=$(aws rds describe-db-instances --region $AWS_REGION --query 'DBInstances[*].DBInstanceIdentifier' --output text)
  if [ ! -z "$db_instance_ids" ]; then
    for db_instance_id in $db_instance_ids; do
      aws rds delete-db-instance --db-instance-identifier $db_instance_id --skip-final-snapshot --region $AWS_REGION
    done
  fi
}

# Function to delete CloudFormation stacks
delete_cloudformation_stacks() {
  stack_names=$(aws cloudformation list-stacks --stack-status-filter CREATE_COMPLETE UPDATE_COMPLETE --region $AWS_REGION --query 'StackSummaries[].StackName' --output text)
  if [ ! -z "$stack_names" ]; then
    for stack_name in $stack_names; do
      aws cloudformation delete-stack --stack-name $stack_name --region $AWS_REGION
    done
  fi
}

# Function to delete Elastic Load Balancers (ELB)
delete_elbs() {
  elb_names=$(aws elb describe-load-balancers --region $AWS_REGION --query 'LoadBalancerDescriptions[*].LoadBalancerName' --output text)
  if [ ! -z "$elb_names" ]; then
    for elb_name in $elb_names; do
      aws elb delete-load-balancer --load-balancer-name $elb_name --region $AWS_REGION
    done
  fi
}

# Function to delete the VPC
delete_vpc() {
  vpc_id=$(aws ec2 describe-vpcs --region $AWS_REGION --query 'Vpcs[?IsDefault==`false`].VpcId' --output text)
  if [ ! -z "$vpc_id" ]; then
    aws ec2 delete-vpc --vpc-id $vpc_id --region $AWS_REGION
  fi
}

# Main script

# Confirm with the user before proceeding
read -p "Are you sure you want to delete all resources in the Ireland (eu-west-1) region, including the VPC? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
  echo "Aborted."
  exit 1
fi

# Delete resources
delete_elbs
delete_rds_instances
delete_ec2_instances
delete_cloudformation_stacks
delete_s3_buckets
delete_vpc

echo "All resources in the Ireland (eu-west-1) region, including the VPC, have been deleted."
