#!/bin/bash

# Get the VPC IDs of all non-default VPCs in the Ireland region
vpc_ids=$(aws ec2 describe-vpcs --filters "Name=isDefault,Values=false" --region eu-west-1 --query 'Vpcs[*].VpcId' --output json | jq -r '.[]')

# Delete each VPC
for vpc_id in $vpc_ids; do
    echo "Deleting VPC: $vpc_id"

    # Delete the security groups associated with the VPC
    security_group_ids=$(aws ec2 describe-security-groups --filters "Name=vpc-id,Values=$vpc_id" --query 'SecurityGroups[*].GroupId' --output json | jq -r '.[]')
    for security_group_id in $security_group_ids; do
        echo "Deleting Security Group: $security_group_id"
        aws ec2 delete-security-group --group-id "$security_group_id"
        if [ $? -eq 0 ]; then
            echo "Security Group $security_group_id deleted successfully"
        else
            echo "Failed to delete Security Group $security_group_id"
        fi
    done

    # Delete the VPC
    echo "Deleting VPC: $vpc_id"
    aws ec2 delete-vpc --vpc-id "$vpc_id"
    if [ $? -eq 0 ]; then
        echo "VPC $vpc_id deleted successfully"
    else
        echo "Failed to delete VPC $vpc_id"
    fi
done
