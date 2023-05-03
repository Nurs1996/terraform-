region = "us-east-1"
cluster_name = "kaizen"
cluster_version = "1.22"
instance_type = "m4.large"
asg_max_size = 20
asg_min_size = 1
tags = {
	Name = "EKS-Kaizen"
	Environment = "Dev"
	Team = "DevOps"
}