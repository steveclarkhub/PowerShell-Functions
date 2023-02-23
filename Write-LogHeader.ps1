 <#
.Synopsis
   Creates a file for writing log events with header information
.DESCRIPTION
   This clobbers file name at $fn_LogPath if exists
   requires logname should be fully qualified
   PSCommandPath is alternative MyInvocation method to ScriptName
.EXAMPLE
   Write-LogHeader "D:\logs\Log_Roller.log" "output from log rolling script" 
.EXAMPLE
   Write-LogHeader "D:\logs\Log_Roller.log"
#>
Function Write-LogHeader {

[cmdletbinding()]
  param (
  [parameter(Mandatory=$True,ValueFromPipeline=$True)]
  [string]$fn_LogPath,

  [parameter(ValueFromPipeline=$True)]
  [string]$fn_ScriptPurpose
  )

  Begin{
  $fn_ScriptName = $myinvocation.ScriptName
  if(!($fn_ScriptName)){$fn_ScriptName = "Unknown"}
  }
  
  Process {
  $ScriptHeader = @"
============== Log Start ==================================
Script Name: $fn_ScriptName
Purpose: $fn_ScriptPurpose
Run Date: $((get-date).ToShortDateString())
Run Time: $((get-date).ToShortTimeString())
User: "$env:userdomain\$env:username"
Host: $env:computername
log location: $fn_LogPath
===========================================================
`n
"@
  }

  end{
  $ScriptHeader | Out-File $fn_LogPath
  }

  } #end function
