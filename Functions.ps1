#Create a new blank file in the current directory with the given filename
#If the file already exists, update its last write time
Function Touch-File
{
    $file = $args[0]
    if($file -eq $null) {
        throw "No filename supplied"
    }

    if(Test-Path $file)
    {
        (Get-ChildItem $file).LastWriteTime = Get-Date
    }
    else
    {
        echo $null > $file
    }
}


#Provide a better directory-browsing experience in powershell
#Always forward valid paths to Push-Location/Pop-Location
#The path '-' will cause a Pop-Location
Function Set-LocationImproved
{
    $path = $args[0]
    if($path -eq $null) {
        return $null
    }

    if(Test-Path $path)
    {
        Push-Location $path
    }
    else
    {
        Pop-Location
    }
}