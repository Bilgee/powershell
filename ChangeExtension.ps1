function Change-Extension 
{
    Param(
        [Parameter(Mandatory=$true)]
        [String]$oldExtension,
        [Parameter(Mandatory=$true)]
        [String]$newExtension,
        [Parameter(Mandatory=$true)]
        [String]$path
    )

    $files = Get-ChildItem -path $path -recurse
    foreach( $file in $files){
        if($file.Extension -eq ".$oldExtension"){
            Rename-Item $file.FullName  "$($file.DirectoryName)\$($file.Basename).$newExtension"
        }
    }
}
