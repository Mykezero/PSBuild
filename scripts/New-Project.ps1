function New-Project
{
    [CmdletBinding()]
    [OutputType("Project")]
    $Project = [PSCustomObject]@{
        PSTypeName = "Project"
        Name = $Name
        Location = $Location
        ProjectFile = $ProjectFile
        Configuration = $Configuration
        Assembly = $Assembly
        Dependencies = $Dependencies
    }

    $Project
}