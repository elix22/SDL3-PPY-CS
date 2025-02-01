dotnet publish -r  ios-arm64 -c Release
mkdir SDL3-CS.Tests.Native.AOT.iOS.framework
install_name_tool -rpath @executable_path @executable_path/Frameworks bin/Release/net9.0/ios-arm64/publish/SDL3-CS.Tests.Native.AOT.iOS.dylib 
install_name_tool -id @rpath/SDL3-CS.Tests.Native.AOT.iOS.framework/SDL3-CS.Tests.Native.AOT.iOS bin/Release/net9.0/ios-arm64/publish/SDL3-CS.Tests.Native.AOT.iOS.dylib 
lipo -create  bin/Release/net9.0/ios-arm64/publish/SDL3-CS.Tests.Native.AOT.iOS.dylib -output SDL3-CS.Tests.Native.AOT.iOS.framework/SDL3-CS.Tests.Native.AOT.iOS
cp Info.plist SDL3-CS.Tests.Native.AOT.iOS.framework