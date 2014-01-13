GTAlgorithms
============ 
------------

GTAlgorithms is an open-source Graph Travel Algorithm (hence GTAlgorithms) library for iOS. It was mainly implemented to be **"plug-and-play" ** and **extensible**.

Installation
-----------
1. Drag and drop the **GTAlgorithms.xcodeproj** into your project.
2. Make sure in `Project > Build Phases > Link Binary With Libraries`that is a listing for `libGTAlgorithms.a`.
3. In `Project > Build Settings > Linking > Other Linker Flags` add the two flags: `-Objc` and `-all_load`.
4. Make sure in your **______________-Prefix.pch** file, add the following: 
```
#ifdef __OBJC__
    #import <GTAlgorithms/GTAlgorithms.h>
#endif
```
5. You are good to go!