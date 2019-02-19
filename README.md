# android_device_asus_X00T

For building TWRP for ASUS ZenFone Max Pro (M1) ONLY

To compile:

```
. build/envsetup.sh && breakfast X00T eng && m recoveryimage -j$(nproc --all)
```

Kernel source: [KudProject/kernel_asus_sdm660](https://github.com/KudProject/kernel_asus_sdm660/tree/android-8.1)
