 <#
.Synopsis
   Append an event description to a log
.DESCRIPTION
   Requires event description (message), entry type and log path
   Entry type: 1=INFO, 2=WARN, 3=ERROR
.EXAMPLE
   Write-LogEntry "$myfile not found at path $mypath" 3 "e:\logs\somelog.log"
#>

function Write-LogEntry {
[cmdletbinding()]
  param (
  [parameter(ValueFromPipeline=$True,Mandatory=$True)]
  [string]$Msg,
  [int]$MType,
  [string]$LogPath
  )

  Begin
  {
    $fn_MType = ""
    Switch ($MType)
    {
      1 {$fn_MType = "INFO"}
      2 {$fn_MType = "WARN"}
      3 {$fn_MType = "ERROR"}
    }
  }

  Process 
  {
    echo "$(get-date -format "yyyy-M-d_H:mm:ss") `| $fn_MType `| $Msg" | out-file $LogPath -Append
  }
} #end function
