# OCI-CloudGuard
The Terraform code perform CloudGuard enablement and create a email notification service in your tenancy. 

## Functionality of the Code

1. The service policy required for enabling the cloudguard will be added (if it was present then the code skip adding the policies)
2. Enable Oracle Cloud Guard in the tenancy.
3. Set the Traget where cloud Guard need to get enabled (Tenancy level or compartment level)
4. Clone the existing Oracle managed Responder Recipe and create a new Responder Recipe. The code use Oracle managed Detector Recipes to detect the problems
5. Enable Cloud Event to publishes the problem details to Oracle Cloud Infrastructure Events Service
6. Create an email notification service to send problem emails.
7. Confugure Oracle Cloud Infrastructure Events Service for Cloud Guard


































