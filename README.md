# Udacity-Capstone
This project is to Build a CI/CD pipeline for Microservices Application using Blue/green deployment in Jenkins

CloudFormation was used to create the Infrastructure as Code. The following resources were created VPC, Internet Gateway, Route Table, Subnet, EC2,Security group , Jenkins-Instance, and eks-cluster


# To Deploy

Create a VPC to deploy EKS cluster with the **amazon-eks-vpc.yaml** script
_./create.bat stack-name amazon-eks-vpc.yaml_

Create EKS cluster with output parameters from the VPC script
> [https://us-east-2.console.aws.amazon.com/ecs/home?region=us-east-2#/clusters]

## ON Jenkins instance 
Install Kubectl: [https://kubernetes.io/docs/tasks/tools/install-kubectl/]
Install AWS CLI: [https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html]

_After that_
## RUN
aws eks --region <region> update-kubeconfig --name <clusterName>

In my context I used
aws eks --region us-east-2 update-kubeconfig --name ibcluster

## CREATE WORKER NODES
Use the amazon-eks-nodegroup.yaml
_./create stack-name amazon-eks-nodegroup.yaml_


