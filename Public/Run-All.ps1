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
