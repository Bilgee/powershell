function Search-Word
{
    Param(
        [Parameter(Mandatory=$true)]
        [String]$word,
        [Parameter(Mandatory=$true)]
        [String]$path
    )

    $files = Get-ChildItem -Recurse -Path $path -File
    $temp_filename = ""
    $pattern = "*"+$word+"*"
    foreach($file in $files){
        $line_number = 0;
        (Get-Content $file.FullName) | foreach-object {
            $line_number++
            if($_ -like $pattern){
                if($file.FullName -ne $temp_filename){
                    $file.FullName
                    $temp_filename = $file.FullName
                }
                echo "${line_number}:$_"
            }
        } 
    }
}
