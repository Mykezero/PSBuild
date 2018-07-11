function Run-Tests {
    Param([object]$project)

    $moduleRoot = Find-Parent "PSBuild"
    $test_runner =  "$moduleRoot\tools\xunit.runner.console.*\tools\net452\xunit.console.x86.exe"
    $test_assembly = $project.Assembly

    &$test_runner $test_assembly 
}
