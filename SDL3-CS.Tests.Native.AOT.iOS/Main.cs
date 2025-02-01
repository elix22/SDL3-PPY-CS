namespace SDL3_CS.Tests.Native.AOT.iOS;

using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using SDL;

/*
run ./build-framework.sh inroder to create an native AOT framework
Xcode-SDL3-iOS-NativeAOT-Test is the Xcode project that tests the native AOT framework
the size is almost 17x smaller than the regular iOS AOT solution
*/
public class Program
{
     [UnmanagedCallersOnly(EntryPoint = "TestMainEntry")]
    public static unsafe void TestMainEntry()
    {
        NativeLibrary.SetDllImportResolver(typeof(SDL3).Assembly, (_, assembly, path) => NativeLibrary.Load("@rpath/SDL3.framework/SDL3", assembly, path));

        SDL3.SDL_RunApp(0, null, &main, IntPtr.Zero);
    }

    [UnmanagedCallersOnly(CallConvs = new[] { typeof(CallConvCdecl) })]
    private static unsafe int main(int argc, byte** argv)
    {
        SDL.Tests.Program.Main();
        return 0;
    }
}