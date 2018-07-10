###############################################################################
## Configuration
###############################################################################
Param([string]$configuration="Release")
Import-Module .\Find-Parent.ps1 -Force
Import-Module .\Find-Child.ps1 -Force

$workspace = Find-Parent "EasyFarm"
$test_runner = $workspace + "\packages\xunit.runner.console.*\tools\net452\xunit.console.x86.exe"
$test_assembly = Find-Child "$workspace\**\bin\$configuration\EasyFarm.Tests.dll"

###############################################################################

&$test_runner $test_assembly

###############################################################################