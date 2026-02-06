
## Clean-up Order:

When cleaning up VPC (i.e. deleting it) see below for recommend order:

    1. Remove the VMs in the VPC
    2. Remove the security groups associated with the VPC
    3. Remove the VPC:
    4. When deleting the VPC it should report that it will also delete these 4 resources:
    5. the Internet gateway
    6. the public route table
    7. the private subnet
    8. the public subnet


## Further Tasks

    - Understand VPCs and how they work
    - Get deployment of app and db working inside VPC
    - Document VPC accordingly
    - What are they?
    - Why implement one?
    - What are CIDR Blocks?
    - Our VPC Diagram?
    - Step by step guide?
    - Redo VPC deployment using notes/documentation
    - Bonus: Can you deploy and ASG in your VPC?!?

## Used for making diagrams

    - https://aws.amazon.com/architecture/icons/
    - https://www.lucidchart.com/pages 


## Proxies

    - https://www.cloudflare.com/en-gb/learning/cdn/glossary/reverse-proxy/
    - https://medium.com/globant/understanding-nginx-as-a-reverse-proxy-564f76e856b2


## VPC Explanation:

    - An entire private network with a custom address range
    - Inside the VPC, we create subnets with their own IP CIDR blocks
    - Each resource can be deployed on the subnets and assigned a private IP address that the resources can communuicate over.
    - By default there is no connection to the internet at all

    - An internet gateway can added to specific subnets to allow internet access.
    - The instances without an internet gateway are still completely private
    - Private resources cannot be SSHd into

    - NAT gateways can allow us to send information to the internet without traffic coming in

    - A route table manages where traffic goes
    - The default route table allows private routing between subnet resources

![alt text](VPCDiagram.png)


    
Tasks:
    Research IaC and Terraform
    What is IaC?
    What are the benefits?
    Who is using it?
    Orchestration vs Config Management?
    What is Terraform?
    How does it work?
    Install TF locally
    Document the installation process

## What is IaC (Infrastructure as Code)

    - The managing and provisioning of infrastructure through code instead of manual processes.
    - Has two subcategories of Orchestration and Config Management 

- Benefits:
    - Launches the same way every time
    - Removes human error
    - Standardised
    - Faster
    - Scalable
    - Allows advanced infrastructure such as containers.
    - Version Control

- Orchestrarion
    - Like building the house
    - Orchestration is the process of automating and coordinating complex workflows and tasks within an IT infrastructure.
    - It involves managing the interactions and dependencies between different systems, services, and applications to ensure that they work together seamlessly to achieve a specific goal. 
    - Orchestration can involve a variety of tasks, such as provisioning and configuring resources, deploying applications, and monitoring performance. It is often used to manage the deployment of virtual machines(VM) and containers across multiple servers or data centers.
    - Orchastration tools include Terraform.

- Configuration Management
    - Like decorating the house
    - Maintaining and updating configurations of an IT infrastructure
    - It involves identifying the current state of the infrastructure, defining the desired state, and implementing changes to move from the current state to the desired state. 
    - Configuration management helps ensure that the infrastructure is consistent, reliable, and secure. It also enables administrators to track changes, troubleshoot issues, and maintain compliance with industry standards and regulations. 
    - Some popular configuration management tools include Ansible, Puppet, Chef, SaltStack, and CFEngine.

- Terraform is used to create and destroy cloud resources in an automated, scalable, fast and hands-off way.
    - Can connect to multiple cloud service provdiers.

