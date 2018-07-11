function Run-Coverage {
	Param(
		[object]$project,
		[string]$filters="+[*]*",
		[string]$reportDir="../results.xml"
	)

	$test_runner = "..\tools\xunit.runner.console.*\tools\net452\xunit.console.x86.exe"
	$test_coverer = "..\tools\OpenCover.*\tools\OpenCover.Console.exe"
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
	mv -Force results.xml $reportDir
}