# azure_assignment
Azure Assignment for Skylabs

Terra assignment:

-> Install Azure  CLI in the host machine.

->  Sign in with your Microft azure portal in your browser and configure Azure  profile using "az login" command from your terminal. Verification code will be generated and paste the same in your azure URL.

-> Install terraform in the host machine from the path https://www.terraform.io/downloads.html

-> Create a new directory and initialize the Git Repo using "git init"

-> Add the remote repo "git remote add origin https://github.com/arunlogo1/azure_assignment.git"

-> pull the master repo in your local host using "git pull origin master"

-> Initialize the terraform script using "terraform init" - it will download necessary plugins and modules

-> plan the infrastructure using "terraform plan"

-> Create the infrastructure using "terraform apply"

-> In case, if you would like to delete the created infracture , execute "terraform destroy"

Output the script:

-> Copy the file disk.sh using copy over ssh command "scp disk.sh user@public:/home/{username}/"

-> Execute the script "./disk.sh" and check the cpu utilization and disk utilization"



Note: 

Both the machines have been same virtual network and it can be communicated each other. (try using "ping public-ip")
