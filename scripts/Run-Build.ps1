function Run-Build {
    Param(
        [object]$project,
        [string]$target="Rebuild",
        [string]$verbosity="Normal"
    )

    $vs_version = "15.0"
    $solution_dir = $project.Location
    $msbuild = "C:\Program Files (x86)\Microsoft Visual Studio\*\*\MSBuild\$vs_version\Bin\msbuild.exe"
    $nuget = "../tools/nuget.exe"
    
    &$nuget restore $solution_dir -Verbosity $verbosity
    &$msbuild $solution_dir /p:configuration=$project.configuration -t:$target /m /verbosity:$verbosity
}