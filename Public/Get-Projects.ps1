function Get-Projects {
    [CmdletBinding()]
    Param($configuration="Release")
    
    $workspace = (New-Object System.IO.DirectoryInfo $(Find-Parent "PSBuild")).Parent.FullName

    $easyfarm = New-Project
    $easyfarm.Name = "EasyFarm"
    $easyfarm.Location = Find-Child $workspace "EasyFarm.sln"
    $easyfarm.ProjectFile = Find-Child $workspace "EasyFarm.csproj"
    $easyfarm.Configuration = $configuration

    $unitTests = New-Project
    $unitTests.Name = "EasyFarm.Tests"
    $unitTests.Location = Find-Child $workspace "EasyFarm.sln"
    $unitTests.ProjectFile = Find-Child $workspace "EasyFarm.Tests.csproj"
    $unitTests.Configuration = $configuration
    $unitTests.Assembly = Find-Child "$workspace" "\\bin\\$configuration\\EasyFarm.Tests.dll"

    $projects = @($easyfarm, $unitTests)

    $projects
}
