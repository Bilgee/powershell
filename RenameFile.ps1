$files = Get-ChildItem -path "C:\Users\bbayarsaikhan\Desktop\temp\" -recurse
foreach( $file in $files){
    if($file.Extension -eq ".ps1"){
        Rename-Item $file.FullName "$($file.FullName).txt"
    }
}