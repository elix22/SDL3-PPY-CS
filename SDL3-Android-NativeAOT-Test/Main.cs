
namespace SDL3_Android_NativeAOT_Test;

using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using SDL;


public class Program
{

    [UnmanagedCallersOnly(EntryPoint = "TestMainEntry")]
    private static unsafe int TestMainEntry(int argc, byte** argv)
    {
        SDL.Tests.Program.Main();
        return 0;
    }
}