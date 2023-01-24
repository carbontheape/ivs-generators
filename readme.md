# ivs-generators

# Dependencies 
- [qb-weathersync](https://github.com/qbcore-framework/qb-weathersync)
- [PolyZone](https://github.com/qbcore-framework/PolyZone)

# Installation
Drag and Drop the script into your resource foler
Go to qb-weathersync/client/client.lua (line 55-56)
Remove the foloowing natives from the thread:
```
SetArtificialLightsState(blackout)
SetArtificialLightsStateAffectsVehicles(blackoutVehicle)
```

# Change Logs
- 1.0 - Inital release
