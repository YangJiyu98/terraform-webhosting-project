# terraform-webhosting-project
Terraform-webhosting-project aims to create a website using Terraform and Microsoft Azure. All infrastructure should be deployed using Root and Child Modules using Terraform.


## Contents
1. [Initializing the project](#initializing-the-project)
2. [Thought process](#thought-process)
3. [Microsoft Azure services used](#microsoft-azure-services-used)


### Initializing the project
1. Install Terrafrom [here](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)
2. Choose your approach and download the maint.tf file to your computer.
3. Authenticate to Azure using the command in your terminal: 
  ``` az login ```.
  A browser will open to authenticate your login details
4. Run ``` terraform init ``` to initialize the project.
5. Run ``` terraform plan ``` to see the changes that will be made to your configuration file.
6. Run ``` terraform apply ``` to apply the changes onto your configuration files

### Thought process
There are 2 different approaches listed below.

IaaS approach
1. Assume everything will fail
2. Create backup for important component to ensure high availability
3. Use load balancer to distribute inbound traffic
4. Use security group rules to ensure network security
<img src="https://user-images.githubusercontent.com/54704393/125039220-d49be680-e0c8-11eb-8598-3c2c6c591519.png" width="550">

Azure App Service approach (Serverless computing)
1. Is fully managed by Azure
2. Simplify operations with automatic platform maintenance and security patching
3. Deploy your website quickly by using this service

<img src="https://user-images.githubusercontent.com/54704393/125024150-d195fb80-e0b2-11eb-934a-e0e84502cb64.png" width="700">

### Microsoft Azure services used
Azure Network interface, Azure public IP, Azure Vnet, Azure VM set, Azure subnet, Azure RG, Azure LB
