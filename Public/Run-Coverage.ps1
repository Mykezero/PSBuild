function Run-Coverage {
	Param(
		[object]$project,
		[string]$filters="+[*]*",
		[string]$reportDir="results.xml"
	)
	
	$moduleRoot = Find-Parent "PSBuild"
	$test_runner = "$moduleRoot\tools\xunit.runner.console.*\tools\net452\xunit.console.x86.exe"
	$test_coverer = "$moduleRoot\tools\OpenCover.*\tools\OpenCover.Console.exe"
	$test_assembly = $project.Assembly
	$test_coverer_filters = $filters
	$bin_dir = $(New-Object System.IO.DirectoryInfo -ArgumentList $project.Assembly).Parent.FullName

	$test_runner = $(ls "$test_runner")[0].FullName
	&$test_coverer `
		-target:"$test_runner" `
		-targetargs:"$test_assembly" `
		-filter:"$test_coverer_filters" `
		-register:"Path32" `
		-searchdirs:"$bin_dir"

	if("results.xml" -ne "$reportDir")
	{
		Copy-Item "results.xml" -Destination "$reportDir" -Force
	}
}
