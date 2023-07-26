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

