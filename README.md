# RedLab
Files to automatically deploy a red team active directory test lab as detailed on [NickZero.co.uk](https://nickzero.co.uk/automating-a-red-team-lab-part-2/)

## Important Note
The URL for the Windows 10 ISO expires after a set period of time, so here's how to update it. In typical MS fashion, it's not simple.

First, browse to the [MS Windows 10 Website](https://www.microsoft.com/en-gb/software-download/windows10ISO) using Google Chrome.

Next, (in Chrome at least) press F12 to open developer tools and go to the Network tab. Click the little "Wifi/cog" icon and change the User agent to "Safari - Mac" then refresh the Microsoft page in your browser. You should now be able to download the actual ISO.

Right click the "64-bit download" button, and select copy link address, then add this into the Windows10.json file.
