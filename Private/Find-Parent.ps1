function Find-Parent {
	[CmdletBinding()]
	Param(
		[string]$Name,
		[int]$Depth = 3
	)
	
	$current = Get-Item .
	if($current.Name -eq $Name){
		return $current.FullName
	}
		
	for($i = 0; $i -lt $Depth; $i++)
	{
		$current = $current.Parent
		if($current.Name -eq $Name){
			return $current.FullName
		}
	}
	
	Write-Error -Message (
		"Failed to find parent directory" + "`r`n" +
		"`r`n" +
		"Input:" + "`r`n" +
		"	Directory: $Name" + "`r`n" +
		"	Depth: $Depth" + "`r`n" +
		"	Current: $Current" + "`r`n"
	)
}