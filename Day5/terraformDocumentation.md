# Terraform

## Basic usage

- Make a seperate folder for your terraform project
- Make a main.tf file in that folder

    - Terraform needs a main.tf file and runs this by default

- Create a .gitignore file, that doesn't expose private and sensitive information. This includes tfstate files, and any files containing credentials/access tokens such as variable.tf files.

### Set-Up

- The file starts with this code block.
    - The quotations contain the cloud provider, such as "aws", "github", etc.
    - Inside add important information pertaining to that provider.
        - For AWS it could be region
        - For github it could be a personal access token
```
provider "" {
  
}
```

- Most things use a resource statement as shown below:
    - The first set of speech marks requires the specific cloud service, e.g. "aws_vpc", "github_repository".
    - The second is the name used to refer to things internally within terraform.
    - Any settings have their own key words and go inside the brackets. Please refer to the documentation for more specifics.
    - https://registry.terraform.io/
```
resource "" "" {
    setting = ""
}
```

## Key commands - Make sure you hve cd'd into the folder with the main.tf file.

- terraform init: grams all backend dependencies for your provider

- terraform fmt: refoormats your code so it is in a standardised terraform format

- terraform plan: Terraform will go to your provider and get details about what is already there and compare it to your proposal. 
It will give you an output telling you what the proposed changes are.
    - The tfstate files this producaes are highly sensitive, do not upload them to a cloud provider/github or expose them in any way.

- terraform apply: The same as plan but allows you to commit the changes.

- terraform destroy: Removes the resources from the cloud provider.

## Using External Variables

- create a variable.tf file
    - If this contains sensitive information like access keys, this must be added to the gitignore file.

- The syntax is shown below:
    - Use the keyword variable and put the variable name in the following speech marks.
    - Inside the block, use 'default' to set a default value.
        - This value can be overridden with an extrernal variable file.
```
variable "aws-region" {
    default = "eu-west-1"
}
```

- To use this type of variable in your code:
    - var.variableName 
    - (replace variableName with the actual name)

    - A successful use is highlighted below:

![alt text](images/externalVarUse.png)

## Use Internal Variables

- Used to reference something created inside your program
    - cloudService.TerraformReference.id
    - An example is shown below:

![alt text](images/internalVariableUse.png)


## VPC Setup
    - For the steps, please refer to:
    - For the syntax, please refer to: