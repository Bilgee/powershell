$files = Get-ChildItem -Recurse -Path C:\scripts\Mod4 -File
$temp_filename = ""
foreach($file in $files){
    (Get-Content $file.FullName) | foreach-object {if($_ -like "*param*"){
        if($file.FullName -ne $temp_filename){
            $file.FullName
            $temp_filename = $file.FullName
        }
        $_
    }} 
}