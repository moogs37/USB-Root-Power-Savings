#--Name:    USB Root Power Disabling
#--Author:  Dallas Smith
#--Created: 9/13/14


$hubs = Get-WmiObject Win32_USBHub
$powerMgmt = Get-WmiObject MSPower_DeviceEnable -Namespace root\wmi | where {$_.InstanceName.Contains($hubs.PNPID)}

foreach ($p in $powerMgmt)
{
    $p.Enable = $False
    $p.psbase.Put()
}