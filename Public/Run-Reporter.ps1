function Run-Reporter 
{
	Param(
		[string]$reportDir="../results.xml",
		[string]$coverageDir="../coverage"
	)
	
	$test_reporter = "..\tools\ReportGenerator.*\tools\ReportGenerator.exe"

	&$test_reporter `
		-reports:"$reportDir"  `
		-targetdir:"$coverageDir"
}