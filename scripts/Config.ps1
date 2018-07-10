Import-Module .\Find-Parent.ps1 -Force
Import-Module .\Find-Child.ps1 -Force
Import-Module .\New-Project.ps1 -Force

function Get-Projects {
    [CmdletBinding()]
    Param($configuration="Release")
    
    $workspace = $(New-Object System.IO.DirectoryInfo $PSScriptRoot).Parent.Parent.FullName

    $easyfarm = New-Project
    $easyfarm.Name = "EasyFarm"
    $easyfarm.Location = Find-Child $workspace "EasyFarm"
    $easyfarm.ProjectFile = Find-Child $workspace "EasyFarm.csproj"
    $easyfarm.Dependencies = @()

    $unitTests = New-Project
    $unitTests.Name = "EasyFarm.Tests"
    $unitTests.Location = Find-Child $workspace "EasyFarm.Tests"
    $unitTests.ProjectFile = Find-Child $workspace "EasyFarm.Tests.csproj"
    $unitTests.Assembly = Find-Child "$workspace" "\\bin\\$configuration\\EasyFarm.Tests.dll"
    $unitTests.Dependencies = @($easyfarm)

    $projects = @($easyfarm, $unitTests)

    $projects
}