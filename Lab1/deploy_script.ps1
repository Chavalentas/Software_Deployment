$rg = "arm_stefan_chvala"
New-AzResourceGroup -Name $rg -Location "Central US" -Force
$templateFile = ".\azuredeploy.json"
$paramsFile = ".\azuredeploy.parameters.json"
New-AzResourceGroupDeployment `
-Name 'studentstefanchvala' `
-ResourceGroupName $rg `
-TemplateFile $templateFile `
-TemplateParameterFile $paramsFile