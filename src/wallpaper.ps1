$imgPath = $args[0]
$code = @' 
using System.Runtime.InteropServices; 
namespace Win32 {
    public class Wallpaper {
        [DllImport("user32.dll", CharSet=CharSet.Auto)]
        static extern int SystemParametersInfo (int uAction, int uParam, string lpvParam, int fuWinIni);

        public static void SetWallpaper(string filePath) {
		    SystemParametersInfo(20, 0, filePath, 3);
        }
    }
}
'@

add-type $code

[Win32.Wallpaper]::SetWallpaper($imgPath)
