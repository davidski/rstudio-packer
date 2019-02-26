## rstudio-packer

Building out an AWS instance of 
[RStudio Server](https://www.rstudio.com/products/rstudio/download-server/) 
whether for accessing large 
amounts of compute resources or to provide a known working environment for 
students is a rite of passage for DevOps-oriented data scientists. 
Rather than re-invent the wheel, you can use this repository to take some 
of the drudgery out of that process.

## What's Does This Do?

Takes a base image and uses Chef together with 
[Packer](https://www.packer.io/) to install RStudio Server with a common set 
of packages, then creates a reusable AMI that new instances can be launched 
in the future.

For many workshop and classroom needs, consider [RStudio Cloud](https://rstudio.cloud/).

## How Do I Use This?

From a workstation with [chefdk](https://downloads.chef.io/chefdk)  and 
[Packer](https://www.packer.io/) installed:

1. Clone this repository.
2. Pull down the chef cookbooks by running `berks update`.
3. Prepare chef by running `berks vendor`.
4. Build the AMI via `packer build rstudio.json`.
5. Enjoy your new AMI!

## How Do I Customize This?

 - `aws_access_key` and `aws_secret_key` - optional AWS credentials, though using 
 something like [aws-vault](https://github.com/99designs/aws-vault) to set 
 temporary credentials via environment variables is a much better idea
 - `availability_zone` - optional AWS availability zone in which to build the image, 
  defaults to us-west-2a
 - `spot_price` - optional price to use for the builder spot instance
 - `ami` - **mandatory parameter** - base AMI to use to build your image, typically either an Ubuntu image or 
 one of the RStudio images by [Louis Aslett](http://www.louisaslett.com/RStudio_AMI/)
 - `vpc_id` - **mandatory parameter** VPC identifier in which to launch the builder instance
 - `subnet_id` - Subnet ID in which to launch the builder instance, will use the 
 default subnet of the VPC if not specified

## Example

This won't work for anyone outside of your humble author, due to the use of the 
particular subnet IDs, but gives a sense of the final command:

> packer build -var 'subnet_id=subnet-75bc4d12' -var 'ami=ami-01d45add662773bed' rstudio.json
