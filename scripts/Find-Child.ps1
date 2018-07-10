function Find-Child {
	[CmdletBinding()]
	Param(
		[string]$path,
		[string]$include
	)
	(Get-ChildItem `
        -Recurse `
		-Path $Path `
		-Include $include | 
    Select-Object `
        -First 1 `
        -Property FullName `
	).FullName
}