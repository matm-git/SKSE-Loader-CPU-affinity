##if ((Get-Process -name Steam -ErrorAction SilentlyContinue) -eq $Null) { write-host("Steam is not running. Please start Steam first") exit }
$config=Get-Content -Path skse_loader_cpuaffinity.json | ConvertFrom-Json

if ($config.cpu_cores -eq 4) { 
	$affinity_config = 0x00000000000000F5
} elseif($config.cpu_cores -eq 6) {
	$affinity_config = 0x0000000000000FF5
} elseif($config.cpu_cores -gt 6) {
	$affinity_config = 0x000000000000FFF5
}else {
	write-host("No valid cpu_cores configuration found in skse_loader_cpuaffinity.json")
	Start-Sleep -Seconds 10
	exit
}

if ($config.game_mode -eq 1) { 
	$Skyrim_version = "SkyrimVR"
	.\sksevr_loader.exe
} elseif ($config.game_mode -eq 2) {
	$Skyrim_version = "Skyrim"
	.\skse64_loader.exe
} else {
	write-host("No valid game_mode configuration found in skse_loader_cpuaffinity.json")
	Start-Sleep -Seconds 10
	exit
}
Start-Sleep -Seconds 90
$skyrim = Get-Process -name $Skyrim_version
$skyrim.ProcessorAffinity=$affinity_config
$filter = 'name = "{0}.exe"' -f $Skyrim_version
Get-WmiObject Win32_process -filter $filter | foreach-object { $_.SetPriority(128) }