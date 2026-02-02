
# VPC Diagram

![alt text](images/vpcOverview.png)

## 1. Make the VPC

![alt text](images/gottoVPC.png)

    - Click orange "Create VPC" button.

### Settings:

    - Click "VPC only"
    - Name: se-<name>-first-2tier-vpc
    - IPv4 CIDR block: IPv4 CIDR manual input
    - IPv4 CIDR: 10.0.0.0/16 - This means every internal address has to start with 10.0. The block is in 8s and the / is how many blocks are static. Possible IPs inside the VPC are 10.0.<0-255>.<0-255>
    - IPv6 CIDR block: No IPv6 CIDR block
    - Tenancy: Default - The options are "Default" and "Dedicated", if it is dedicated, it means that no other organisation runs on that hardware infrastructure, while default means it is shared with other clients.
    - VPC encryption control ($): None
    - Tags: default.

    - Click orange create VPC button

![alt text](images/vpcSettings.png)

## 2. Make the Public and Private Subnets

    - Navigate to subnets on the left hand side of the page

    - click orange "Create subnet" button

![alt text](images/subnetPage.png)

### Settings:

    - VPC: The VPC you just created (se-<name>-first-2tier-vpc)
    - Subnet Settings:
        - Subnet name: se-<name>-public-subnet
        - Availability Zone: Europe (Ireland) / eu-west-1a
        - IPv4 VPC CIDR block: 10.0.0.0/16
        - IPv4 subnet CIDR block: 10.0.2.0/24 (Must be smaller than VPCs)
        - Tags: default

    - Click "Add new Subnet" button

    - Subnet Settings:
        - Subnet name: se-<name>-private-subnet
        - Availability Zone: Europe (Ireland) / eu-west-1b
        - IPv4 VPC CIDR block: 10.0.0.0/16
        - IPv4 subnet CIDR block: 10.0.3.0/24
        - Tags: Default

    - Click "create subnets" button 

![alt text](images/subnetSettings1.png)
![alt text](images/subnetSettings2.png)

![alt text](subnetsList.png)

## 3. Create Internet Gateway

    - Go to "Internet Gateway" on left hand menu
    - Click "Create internet gateway" button

### Settings:

    - Name Tag: se-<name>-2tier-vpc-ig
    - Tags: Default

    - Click "create internet gateway"

![alt text](images/internetGatewaySettings.png)
![alt text](images/subnetsList.png)

    - Attatch VPC:

        - Options dropdown
        - Attatch VPC

![alt text](images/attatchGateway.png)
![alt text](images/attatchToVPCSettings.png)

## 4. Make Route Tables

    - Route table on the left hand menu
    - Click "Create route table" button

### Settings:

    - se-alex-2tier-vpc-public-rt
    - VPC: Your VPC from earlier

![alt text](images/publicRouteTableSettings.png)

    - Addint route table to subnet:

        - Go to "Subnet associations" tab
        - Click "Edit subnet associations"
        
![alt text](images/subnetAccosiationsEdit.png)
![alt text](images/subnetList.png)
![alt text](images/subnetAssociationsList.png)

    - Go to "routes" tab
    - Click on "edit routes"
    - Click "Add route"

    Settings:
        - Destination: 0.0.0.0/0
        - Target: Internet Gateway, Add your internet gateway

    - Click "save changes"

![alt text](images/rerouteTable.png)
![alt text](images/editRouteSettings.png)
![alt text](images/routesList.png)

    - This should show in your resource map

![alt text](images/resourceMap.png)


## 5. Add Security Group

    - Launch EC2 images with your database image
        - Use these security group settings:

![alt text](images/launchImageSettingsA.png)
![alt text](images/launchImageSettingsB.png)

    - Launch EC2 images with your app image
        - Use these security group settings:

![alt text](images/networkSecurityGroup.png)

    

Remake the VPC again, document in depth this time (Screenshots and step by step guidance). Steps below (at a glance)
    Make VPC (10.0.0.0/16)
    Make Subnets (10.0.2.0/24 and 10.0.3.0/24)
    Create IG and attach to VPC
    Create Public RT
    Associate with public subnet
    Add route to the internet via IG  (0.0.0.0/0)
    Check setup
    Try to deploy app and db
    Try to automate app and db deployment in your VPC by using your own images and user data 

 


