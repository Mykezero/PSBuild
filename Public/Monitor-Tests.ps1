function Monitor-Tests
{
	Param([object]$project)

	$watcher = New-Object System.IO.FileSystemWatcher
	$watcher.Path = $project.Location
	$watcher.IncludeSubdirectories = $true
	$watcher.EnableRaisingEvents = $true
	$watcher.NotifyFilter = [System.IO.NotifyFilters]::LastWrite -bor [System.IO.NotifyFilters]::FileName 

	while($true) 
	{
		$result = $watcher.WaitForChanged([System.IO.WatcherChangeTypes]::Changed -bor [System.IO.WatcherChangeTypes]::Renamed -bor [System.IO.WatcherChangeTypes]::Created, 1000);
		if($result.TimedOut){ continue; }
		if($result.Name.StartsWith(".git")){ continue; }

		Write-Host "### Running Tests ###" -BackgroundColor Green
		""
		Run-Build -project $project -target "Build" -verbosity "Quiet"
		""
		Run-Tests -project $project
		""
		Write-Host "### Complete! ###" -BackgroundColor Green
		""
	}
}
