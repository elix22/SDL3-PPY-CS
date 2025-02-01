dotnet publish -r linux-bionic-arm64 -p:DisableUnsupportedError=true -p:PublishAotUsingRuntimePack=true  -p:RemoveSections=true
dotnet publish -r linux-bionic-arm -p:DisableUnsupportedError=true -p:PublishAotUsingRuntimePack=true  -p:RemoveSections=true
dotnet publish -r linux-bionic-x64 -p:DisableUnsupportedError=true -p:PublishAotUsingRuntimePack=true  -p:RemoveSections=true

cp  bin/Release/net9.0/linux-bionic-arm64/publish/SDL3-Android-NativeAOT-Test.so ../org.libsdl.nativeaot/app/jni/libs/arm64-v8a
cp  bin/Release/net9.0/linux-bionic-arm/publish/SDL3-Android-NativeAOT-Test.so ../org.libsdl.nativeaot/app/jni/libs/armeabi-v7a
cp  bin/Release/net9.0/linux-bionic-x64/publish/SDL3-Android-NativeAOT-Test.so ../org.libsdl.nativeaot/app/jni/libs/x86_64

cd ../org.libsdl.nativeaot
./gradlew assembleDebug