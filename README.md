# Udacity-Capstone
This project is to Build a CI/CD pipeline for Microservices Application using rolling deployment in Jenkins by installing Blue Ocean plugs-in to complete CI/CD deployment

CloudFormation was used to create the Infrastructure as Code. The following resources were created VPC, Internet Gateway, Route Table, Subnet, EC2,Security group , Jenkins-Instance, and eks-cluster


## To Deploy

Create a VPC to deploy EKS cluster with the **amazon-eks-vpc.yaml** script
_./create.bat stack-name amazon-eks-vpc.yaml_

Create EKS cluster with output parameters from the VPC script

## On Jenkins instance 
Install Kubectl: [https://kubernetes.io/docs/tasks/tools/install-kubectl/]
Install AWS CLI: [https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html]

_After that_
## RUN
aws eks --region <region> update-kubeconfig --name <clusterName>

In my context I used
aws eks --region us-east-2 update-kubeconfig --name ibcluster

## Create Worker Nodes
Use the amazon-eks-nodegroup.yaml
_./create stack-name amazon-eks-nodegroup.yaml_
Goto Cloudformation; Enter required variables from previous script output

Give the below URL as the Amazon S3 URL and click Next.
[https://amazon-eks.s3-us-west-2.amazonaws.com/cloudformation/2019-02-11/amazon-eks-nodegroup.yaml]
***same with amazon-eks-nodegroup.yaml***

Ref:
[https://medium.com/faun/create-your-first-application-on-aws-eks-kubernetes-cluster-874ee9681293]

## List Nodes
 _kubectl get nodes_

 ## Configuring Jenkins Host
 _sudo mkdir -p /var/lib/jenkins/.kube_
 _sudo cp  ~/.kube/aws-auth-cm.yaml /var/lib/jenkins/.kube_
_cd /var/lib/jenkins/.kube/_
_sudo chown jenkins:jenkins config_
_sudo chmod 750 config_

