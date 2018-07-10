Import-Module .\Find-Parent.ps1 -Force
Import-Module .\Find-Child.ps1 -Force
Import-Module .\New-Project.ps1 -Force

$easyfarm = New-Project
$easyfarm.Name = "EasyFarm"
$easyfarm.Workspace = Find-Parent "EasyFarm"
$easyfarm.Location = Find-Child "EasyFarm.Tests"
$easyfarm.ProjectFile = Find-Child $easyfarm.Location "EasyFarm.csproj"
$easyfarm.Dependencies = @($easyfarm)