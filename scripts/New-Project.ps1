function New-Project
{
    [CmdletBinding()]
    [OutputType("Project")]
    $Project = [PSCustomObject]@{
        PSTypeName = "Project"
        Name = $Name
        Location = $Location
        ProjectFile = $ProjectFile
        Dependencies = $Dependencies
    }

    $Project
}