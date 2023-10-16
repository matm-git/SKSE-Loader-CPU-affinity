# SKSE-Loader-CPU-affinity
This mod starts skse64_loader.exe (or VR version of it) and automatically sets CPU priority to high as well as CPU affinity as suggested by most performance tweakers (disables one of the logical cores on the first 2 physical cores). 

The aim of this is mod is to reduce stutters in the game which is working fine for me.
The mod does the same thing as described in MO2 with CPU Priority and Affinity Setup
Only I did not like the manual parts, so this exe file can be started instead of skse64_loader.exe and does it all automatically.
Also it does not require loading additional DLLs which utilise memory.
It is a simple Powershell Script which I compiled into an exe file.
It starts skse64_loader.exe, then waits 90 seconds and sets CPU priority high and CPU affinity in an optimised way (disables one of the logical cores on the first 2 physical cores).

Compatibility
This mod is intended for CPUs with minimum 4 cores and SMT/Hyperthreading like most CPUs nowadays have.
If you have less cores (or no SMT/Hyperthreading) please do not use this mod.
This mod is also fully compatible with SkyrimVR. You only need to edit the configuration file (skse_loader_cpuaffinity.json) and set game mode to 1.

Installation
Extract the zip into your Skyrim installation folder where Skyrim.exe is located.
Edit the configuration file (skse_loader_cpuaffinity.json) and set cpu_cores variable to the number of cores your machine has.
Load it from your preferred mod manager instead of skse64_loader.exe to start the game in the future. Now automatically Skyrim runs with optimised priority and CPU affinity.
