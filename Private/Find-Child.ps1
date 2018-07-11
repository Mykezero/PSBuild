function Find-Child {
	[CmdletBinding()]
	Param(
		[string]$path,
		[string]$filter
	)

	$path = (Get-ChildItem `
        -Recurse `
		-Path $Path | 
	Select-Object `
		-Property FullName |
	Where-Object `
		-Property FullName `
		-Match $filter |
	Select-Object `
		-First 1
	).FullName
	
	$path
}
