function Run-Tests {
    Param(
        [string]$configuration="Release",
        [object]$project
    )

    $test_runner =  "..\tools\xunit.runner.console.*\tools\net452\xunit.console.x86.exe"
    $test_assembly = $project.Assembly

    &$test_runner $test_assembly 
}