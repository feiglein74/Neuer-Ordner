
$myCreds = Get-Credential
#$PCName = Get-ADComputer -Filter 'Name -like "*"' -Properties * | Select-Object -ExpandProperty Name
#$PCName = Get-ADComputer -filter 'OperatingSystem -like "Windows Server*"' -Properties * | where-object PasswordLastset -gt "2023.10.01" | Select-Object -ExpandProperty Name
$PCName = Get-ADComputer -filter 'OperatingSystem -like "Windows Server*"' -Properties * | Select-Object -ExpandProperty Name

$PCName | Foreach-Object { Invoke-Command -ErrorAction SilentlyContinue -Credential $mycreds -ComputerName $_ -ScriptBlock {get-windowsfeature -name windows-defender | select-object InstallState }}
