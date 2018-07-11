function Monitor-Tests
{
	Param([string]$configuration="Release")
	$Workspace = Find-Parent "EasyFarm"

	$watcher = New-Object System.IO.FileSystemWatcher
	$watcher.Path = $Workspace
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
		Run-Build -configuration $configuration -target "Build" -verbosity "Quiet"
		""
		Run-Tests $configuration
		""
		Write-Host "### Complete! ###" -BackgroundColor Green
		""
	}
}
