# Define the Vault IAM policy
resource "aws_iam_policy" "vault_policy" {
  name        = "vault_policy"
  description = "Policy for Vault IAM role"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "kms:Decrypt",
        "kms:Encrypt",
        "kms:GenerateDataKey*",
        "kms:DescribeKey"
      ],
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::my-vault-bucket",
        "arn:aws:s3:::my-vault-bucket/*"
      ]
    }
  ]
}
EOF
}

# Define the Vault IAM role
resource "aws_iam_role" "vault_role" {
  name = "vault_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# Attach the Vault IAM policy to the Vault IAM role
resource "aws_iam_role_policy_attachment" "vault_policy_attachment" {
  role       = aws_iam_role.vault_role.name
  policy_arn = aws_iam_policy.vault_policy.arn
}
