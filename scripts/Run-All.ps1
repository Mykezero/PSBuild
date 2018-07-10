Import-Module .\Config.ps1 -Force
Import-Module .\Run-Build.ps1 -Force
Import-Module .\Run-Tests.ps1 -Force
Import-Module .\Run-Coverage.ps1 -Force
Import-Module .\Run-Reporter.ps1 -Force

function Run-All {
    Param([string]$configuration="Release")
    $projects = Get-Projects $configuration

    foreach ($project in $projects) {
        Run-Build -Project $project
        if ($project.Assembly -eq $null) { continue; }
        Run-Coverage -Project $project -filters "+[EasyFarm]* +[MemoryAPI]* -[EasyFarm.Tests]*"
        Run-Reporter
    }
}
