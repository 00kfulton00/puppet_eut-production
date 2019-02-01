# Powershell script to test the existence of the UNiBLOB

# This line sets the output of "Test-Path" to the variable "uniblob"
$uniblob = Test-Path C:\tmp\UNiBLOB.txt

# This line writes the ouput of the variable and associates it "uniblob" in plain text. This is how facter is able to obtain the output
Write-Output "uniblob=$uniblob"
