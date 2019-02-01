$printer = Get-WmiObject win32_printer | select -Exp ShareName

$printer_check = If ($printer -eq "US-NYC-MFD1") { 'True' } else { 'False' }

Write-Output "printer_check=$printer_check"
