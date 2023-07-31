provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_user" "user1" {
    name = "karan"
    path = "/"
}

resource "aws_iam_user_policy_attachment" "attach_to_user1" {
    user = "aws_iam_user.user1.name"
    policy_arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"

}

#############################################################
now i want to create user manish, karan and samrat using terraform in aws , how to create it  

provider "aws" {
  region = "us-east-1"  
}

resource "aws_iam_user" "manish_user" {
  name = "manish"
  path = "/users/"
}

resource "aws_iam_user" "karan_user" {
  name = "karan"
  path = "/users/"
}

resource "aws_iam_user" "samrat_user" {
  name = "samrat"
  path = "/users/"
}

##################################################################

provider "aws" {
    region = "us-east-1"
}

variable "user_names" {
    type = set(string)
    default = ["karan", "manish", "samrat"]
}

resource "aws_iam_user" "devs" {
    for_each = var.user_names
    name = each.key
    path = "/users/"
}

##########################################################

variable "user_names" {
    type = set(string)
    default = ["karan", "manish", "samrat"]
}    i have declared the variables for terraform but i want to create aws user for only manish , how to do it ?


provider "aws" {
    region = "us_east_1"
}

variable "user_names" {
    type = set(string)
    default = ["karan", "manish", "samrat"]
}

resource "aws_iam_user" "devs" {
    for_each = var.user_names
    name = each.key
    path = "/users/"
    count = each.key == "manish" ? 1 : 0
}

 count = each.key == "manish" ? 1 : 0    what 1 : 0 here ?

 In the Terraform configuration `count = each.key == "manish" ? 1 : 0`, the `1 : 0` part is a ternary conditional expression. It is used to evaluate the condition `each.key == "manish"` and produce different results based on whether the condition is true or false.

Here's the breakdown of the expression:

- `each.key == "manish"`: This is the condition being evaluated. It checks if the current user name (`each.key`) is equal to "manish".

- `?`: This is the ternary operator, which works like an if-else statement. If the condition before the `?` is true, the expression before the `:` is executed. Otherwise, the expression after the `:` is executed.

- `1`: This is the value returned if the condition is true. In this case, if the current user name is "manish", the expression will evaluate to 1.

- `0`: This is the value returned if the condition is false. If the current user name is not "manish", the expression will evaluate to 0.

So, the entire expression `count = each.key == "manish" ? 1 : 0` means:

- If the current user name (`each.key`) is "manish", set the `count` attribute to 1 (i.e., create one instance of the resource).
- If the current user name is not "manish", set the `count` attribute to 0 (i.e., do not create any instances of the resource).

In other words, this expression controls the number of instances of the `aws_iam_user` resource that will be created based on the condition. It ensures that the IAM user is created only for "manish" and not for other user names in the `user_names` variable.

################################################

{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "ec2:DescribeInstances",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::example-bucket/*"
    }
  ]
}    iwant to create inline policy for user manish which is already created in aws, how to do it ?


provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_user_policy" "manish_inline_policy" {
    name = "ManishInlinePolicy"
    user = "manish"
    policy = jsoncode({
         Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "ec2:DescribeInstances"
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = "s3:GetObject"
        Resource = "arn:aws:s3:::example-bucket/*"
      }
    ]
    })
}

#########################################################
how to manages terraform versions ?

tfenv   # version manager 

specifying the required version of code 

terraform {
  required_version = ">= 0.14.7"
}

terraform {
  required_version = ">= 0.14, < 0.15"
}

Upgrade Considerations: Before upgrading Terraform, review the release notes for the new version to understand any potential breaking changes or deprecations that might affect your existing code.

Testing and Validation: Always test your Terraform code with the new version in a non-production environment before applying changes in production. This ensures that your infrastructure code works as expected with the new version.

Version Pinning: In certain cases, you may want to "pin" the Terraform version used by your team or project. This helps ensure consistency across the development and deployment process. You can pin the version in your version control system (e.g., Git) by including the Terraform binary in the repository or by using a tool like "tfenv" to set the version.

##################################
 
 what is terraform module ?

It is a collection of multiple terraform configuration in a single directory.
benefits:
1. reusability
2. modularity
3. scalability

you should create modules when you need to use it repeatably to implement on multiple locations.







