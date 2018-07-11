function Run-Reporter 
{
	Param(
		[string]$reportDir="../results.xml",
		[string]$coverageDir="../coverage"
	)
        $moduleRoot = Find-Parent "PSBuild"
	$test_reporter = "$moduleRoot\tools\ReportGenerator.*\tools\ReportGenerator.exe"

	&$test_reporter `
		-reports:"$reportDir"  `
		-targetdir:"$coverageDir"
}
