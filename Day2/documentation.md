
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


## Until 11:45

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