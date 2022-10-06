# Lab 1


## Prerequisites
* Microsoft Azure Account with a subscription
* Visual Studio Code with the ARM Tools Extension


Please follow the instructions below to successfully create the resources.

* Open Windows Powershell and type in the following command: **Connect-AzAccount**
* Execute the following script (or execute directly the file **deploy_script.ps1**, make sure you are in the 
Lab1 folder for this):

```ps1
$rg = "arm_stefan_chvala"
New-AzResourceGroup -Name $rg -Location "Central US" -Force
$templateFile = ".\azuredeploy.json"
$paramsFile = ".\azuredeploy.parameters.json"
New-AzResourceGroupDeployment `
-Name 'studentstefanchvala' `
-ResourceGroupName $rg `
-TemplateFile $templateFile `
-TemplateParameterFile $paramsFile
```

## Helpful links
* https://www.youtube.com/watch?v=Dwb3kHj9_iY
* https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/quickstart-create-templates-use-the-portal
* https://www.youtube.com/watch?v=Ge_Sp-1lWZ4
* https://learn.microsoft.com/en-us/azure/templates/
* https://github.com/Azure/azure-quickstart-templates
* https://www.youtube.com/watch?v=3xbZJT3hTsQ
* https://www.youtube.com/watch?v=K_ETQR-swnU
* https://www.youtube.com/watch?v=3xbZJT3hTsQ

## Personal experience
I got to the result incrementally, by adding new features or new knowledge step by step.
First I followed this [link](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/template-tutorial-create-first-template?tabs=azure-powershell)
 and created and deployed a demo template.
After that I looked at this [link](https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/syntax)
 to understand the syntax of an ARM template better.
I managed to deploy the storage account pretty much without complaint thanks to this 
[link](https://github.com/Azure/azure-quickstart-templates/blob/master/quickstarts/microsoft.storage/storage-account-create/azuredeploy.json)
 where you can find a template. The link is part of a repository that is very useful because you can find templates for all kinds of resources.
The template for the Storage Accout was first with hardcoded values. 
Then, using the **.parameters** template, I replaced the hardcoded values with configurable parameters. The following [video](https://www.youtube.com/watch?v=3xbZJT3hTsQ)
 helped me to do this.
As the last part, I edited the template for the web app for Node.js. 
After reading this [tutorial](https://github.com/Azure/azure-quickstart-templates/blob/master/quickstarts/microsoft.web/webapp-linux-node/GettingStarted.md), 
it occurred to me that in addition to the app service, you also need to create a hosting plan, which is a standalone resource.



