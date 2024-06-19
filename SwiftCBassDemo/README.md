# SwiftCBassDemo
This app demonstrates to Swift developers how easy it is to import the CBass package to gain access to the BASS audio library APIs.  The app render a real-time spectrum of a music file or live microphone input.

This is a Swift Xcode project incorporating the BASS audio library.  It is multiplatform (meaning it works on both macOS and iOS devices).  The app has BASS code to play an included mp3 music file and render it's real-time spectrum.  (The license-free music file is "The Elevator Bossa Nova" from Bensound.com ).  Changing the micOn variable to true enables live microphone input.

The CBass package is free and open-sourced on GitHub.  The BASS audio library itself is free for non-commercial usage.  For commercial usage, see https://www.un4seen.com for licensing information.

-------------------
Here's how to import CBass into a new Swift project: 

Step 1:  
In Xcode, create a new multiplatform app.  Build and run it to get a window displaying "Hello, world!".

Step 2:  
Under the "File" menu, select "Add Package Dependencies...".  In the resultant pop-up window, click "+" in the lower left corner, and select "Add Source Control Account...".  Select "GitHub", and sign into your GitHub account (using your GitHub Personal Access Token).

Type " https://github.com/Treata11/CBass ".

Step 3:   
A pop-up window appears allowing you to choose whichever package products you wish to install.  The CBass package products include: Bass, BassApe, BassDSD, BassENC, BassENC.FLAC, BassENC.MP3, BassENC.OGG, BassENC.Opus, Bass FLAC, BassFX, BassHLS, BassLoud, BassMIDI, BassMPC, BassMix, BassOpus, BassSPX, and BassTTA.  In this project, we installed just the first one.

Step 4:
Add "import Bass" to the top of any Swift file using any BASS commands.

Step 5:  
To enable live microphone input, check the "Resource Access: Audio Input" box in the SwiftCBassDemo TARGET, "Signing & Capabilites" heading, "All" subheading, "Hardened Runtime" section.  
Also, you must add a "Privacy - Microphone Usage Description" (such as "This app analyzes audio from the microphone."  Add this in the SwiftBassDemo TARGET, Info heading, "Custom Application Target Properties" section.
