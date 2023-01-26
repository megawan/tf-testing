module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.5.1"

  cluster_name                   = var.name
  cluster_version                = var.cluster_version
  cluster_endpoint_public_access = true

  # IPV6
  # cluster_ip_family = "ipv6"

  # We are using the IRSA created below for permissions
  # However, we have to deploy with the policy attached FIRST (when creating a fresh cluster)
  # and then turn this off after the cluster/node group is created. Without this initial policy,
  # the VPC CNI fails to assign IPs and nodes cannot join the cluster
  # See https://github.com/aws/containers-roadmap/issues/1666 for more context
  # TODO - remove this policy once AWS releases a managed version similar to AmazonEKS_CNI_Policy (IPv4)
  # create_cni_ipv6_iam_policy = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent              = true
      # service_account_role_arn = module.vpc_cni_irsa.iam_role_arn
      # configuration_values = jsonencode({
      #   env = {
      #     # Reference docs https://docs.aws.amazon.com/eks/latest/userguide/cni-increase-ip-addresses.html
      #     ENABLE_PREFIX_DELEGATION = "true"
      #     WARM_PREFIX_TARGET       = "1"
      #   }
      # })
    }
  }

  vpc_id                   = data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids               = [data.terraform_remote_state.vpc.outputs.private_subnets, data.terraform_remote_state.vpc.outputs.public_subnets]
  control_plane_subnet_ids = data.terraform_remote_state.vpc.outputs.public_subnets

  create_aws_auth_configmap = false
  manage_aws_auth_configmap = true


  eks_managed_node_group_defaults = {
    ami_type       = "AL2_x86_64"
    instance_types = ["t3.medium", "t3.large"]

    # We are using the IRSA created below for permissions
    # However, we have to deploy with the policy attached FIRST (when creating a fresh cluster)
    # and then turn this off after the cluster/node group is created. Without this initial policy,
    # the VPC CNI fails to assign IPs and nodes cannot join the cluster
    # See https://github.com/aws/containers-roadmap/issues/1666 for more context
    iam_role_attach_cni_policy = true
  }

  eks_managed_node_groups = {
    # Default node group - as provided by AWS EKS
    default_node_group = {
      # By default, the module creates a launch template to ensure tags are propagated to instances, etc.,
      # so we need to disable it to use the default template provided by the AWS EKS managed node group service
      use_custom_launch_template = false
      disk_size = 20

      # Remote access cannot be specified with a launch template
      remote_access = {
        ec2_ssh_key               = var.key_name
        source_security_group_ids = [aws_security_group.sg.id]
      }
    }

    # Default node group - as provided by AWS EKS using Bottlerocket
    # bottlerocket_default = {
    #   use_custom_launch_template = false

    #   ami_type = "BOTTLEROCKET_x86_64"
    #   platform = "bottlerocket"
    #   instance_types = ["t3.small"]
    # }

    # # Adds to the AWS provided user data
    # bottlerocket_add = {
    #   ami_type = "BOTTLEROCKET_x86_64"
    #   platform = "bottlerocket"

    #   # This will get added to what AWS provides
    #   bootstrap_extra_args = <<-EOT
    #     # extra args added
    #     [settings.kernel]
    #     lockdown = "integrity"
    #   EOT
    # }
  }

  tags = {
    Environment     = var.environment
    Terraform       = true
  }  
}