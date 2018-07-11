function Get-Projects {
    [CmdletBinding()]
    Param($configuration="Release")
    
    $workspace = (New-Object System.IO.DirectoryInfo $(Find-Parent "PSBuild")).Parent.FullName

    $easyfarm = New-Project
    $easyfarm.Name = "EasyFarm"
    $easyfarm.SolutionFile = Find-Child $workspace "EasyFarm.sln"
    $easyfarm.ProjectFile = Find-Child $workspace "EasyFarm.csproj"
    $easyfarm.Location = Find-Child $workspace "EasyFarm"
    $easyfarm.Configuration = $configuration

    $unitTests = New-Project
    $unitTests.Name = "EasyFarm.Tests"
    $unitTests.SolutionFile = Find-Child $workspace "EasyFarm.sln"
    $unitTests.ProjectFile = Find-Child $workspace "EasyFarm.Tests.csproj"
    $unitTests.Location = Find-Child $workspace "EasyFarm.Tests"
    $unitTests.Configuration = $configuration
    $unitTests.Assembly = Find-Child "$workspace" "\\bin\\$configuration\\EasyFarm.Tests.dll"

    $projects = @($easyfarm, $unitTests)

    $projects
}
