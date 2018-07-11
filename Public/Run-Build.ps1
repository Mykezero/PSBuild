function Run-Build {
    Param(
        [object]$project,
        [string]$target="Rebuild",
        [string]$verbosity="Normal"
    )

    $vs_version = "15.0"
    $solution_dir = $project.SolutionFile
    $msbuild = "C:\Program Files (x86)\Microsoft Visual Studio\*\*\MSBuild\$vs_version\Bin\msbuild.exe"
    $moduleRoot = Find-Parent "PSBuild"
    $nuget = "$moduleRoot/tools/nuget.exe"
    
    &$nuget restore $solution_dir -Verbosity $verbosity
    &$msbuild $solution_dir /p:configuration=$project.configuration -t:$target /m /verbosity:$verbosity
}
