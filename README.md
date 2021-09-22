# OCI-CloudGuard
The Terraform code perform CloudGuard enablement and create a email notification service in your tenancy.

 ## Description  

The code help you to enable Oracle Cloud Guard in your tenancy along with an optional event and notification service. The notification service will trigger email notifications for the detected problems. 

## Architecture Diagram 

Here is a high level diagram for OCI Cloud Guard Workflow.

![](CG.png)

## Functionality of the Code

1. The service policy required for enabling the cloudguard will be added.
2. Enable Oracle Cloud Guard in the tenancy.
3. Set the Traget where Cloud Guard need to get enabled (Tenancy level or compartment level)
4. Clone the existing Oracle managed Responder Recipe and create a new Responder Recipe. The code use Oracle managed Detector Recipes to detect the problems
5. Enable Cloud Event to publishes the problem details to Oracle Cloud Infrastructure Events Service
6. Create an email notification service to send detected problems via emails. (optional)
7. Confugure Oracle Cloud Infrastructure Events Service for Cloud Guard.

### Method: 1. Deploy Using Oracle Resource Manager

1. Click [![Deploy to Oracle Cloud](https://oci-resourcemanager-plugin.plugins.oci.oraclecloud.com/latest/deploy-to-oracle-cloud.svg)](https://cloud.oracle.com/resourcemanager/stacks/create?region=home&zipUrl=https://github.com/balus7891/OCI-CloudGuard/releases/download/v1.0/OCI_Cloud_Guard.zip)

    If you aren't already signed in, when prompted, enter the tenancy and user credentials. 

2. Review and accept the terms and conditions.

3. Select the region where you want to deploy the stack.

4. Follow the on-screen prompts and instructions to create the stack. Supply the required values

5. After creating the stack, click **Plan** button.

6. Wait for the job to be completed, and review the plan.

    To make any changes, return to the Stack Details page, click **Edit Stack**, and make the required changes. Then, run the **Plan** action again. (It's a best practice always plan and verify the action before **apply**)

7. If no further changes are necessary, return to the Stack Details page, click **Apply**. 

#### OCI Resource Manager Stack Output

Once the job finsihed sucessfully you will receive a cloud guard enabled output as well as email notification acceptance guidelines. 


### Method 2: Deploy with Terraform CLI

### STEP 1.

Make sure Terraform installed in your local machine. verify using below command. 

```
Linux/Mac output

$ terraform --version

Terraform v0.12.16

Your version of Terraform is out of date! The latest version
is 0.12.17. You can update by downloading from https://www.terraform.io/downloads.html
------------------------------------------------------------------------------------------

Windows output

> terraform.exe -v
Terraform v0.15.3
on windows_amd64

Your version of Terraform is out of date! The latest version
is 1.0.3. You can update by downloading from https://www.terraform.io/downloads.html

```
### STEP 2.

Clone the repo from GitHub.com by executing the command as follows 
```
git clone https://github.com/balus7891/OCI-CloudGuard.git
```
### STEP 3. 
Navigate to the directory (OCI-CloudGuard) and update the appropriate values in **terraform.tfvars** file. Update each field carefully with the instructions mentioned as comments.

If you don't want to create any **Ecent and Notification Service** set the paramenter **ons_enabled = false**


All set !!! Now you are good to **RUN** the below.

**terraform init**

**terraform plan**

**terraform apply**

Refer the output for successful completion 

_To remove the service run the below_

**terraform destroy**


## Conclusion

###### The code help you easily enable cloud guard and associated configuratiions along with an optional event and notification service for the detected problems. 


## I hope the script helps !!!
Balasubramannyam Sunil 



































