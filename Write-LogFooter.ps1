<#
.Synopsis
   Appends footer to script log
.DESCRIPTION
   requires fully qualified log path
.EXAMPLE
   Write-LogFooter "D:\logs\Somelog.log"
#>
Function Write-LogFooter {
[cmdletbinding()]
  param (
  [parameter(Mandatory=$True)]
  [string]$fn_LogPath
  )

  Begin{}
  
  Process {$ScriptFooter = @"
`n`n
============== Log Finished ===============================
Finish Date: $((get-date).ToShortDateString())
Finish Time: $((get-date).ToShortTimeString())
===========================================================
`n
"@
$ScriptFooter | Out-File $fn_LogPath -Append}

  end{}

  } #end function
