function New-Workspace
{
    [CmdletBinding()]
    $Workspace = [PSCustomObject]@{
        Name = $Name
        Location = $Location
        Projects = $Projects
    }

    $Workspace
}