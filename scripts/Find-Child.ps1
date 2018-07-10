function Find-Child {
	[CmdletBinding()]
	Param(
		[string]$Path
	)
	(Get-ChildItem `
        -Recurse `
        -Path $Path | 
    Select-Object `
        -First 1 `
        -Property FullName `
	).FullName
}