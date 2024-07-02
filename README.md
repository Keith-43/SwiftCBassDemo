# SwiftCBassDemo
This app demonstrates to Swift developers how easy it is to import the CBass package to gain access to the BASS audio library APIs.  The app render a real-time spectrum of a music file or live microphone input.

This is a Swift Xcode project incorporating the BASS audio library.  It is multiplatform (meaning it works on both macOS and iOS devices).  The app has BASS code to play an included mp3 music file and render it's real-time spectrum.  (The license-free music file is "The Elevator Bossa Nova" from Bensound.com ).  Changing the micOn variable to true enables live microphone input.

The CBass package is free and open-sourced on GitHub.  The BASS audio library itself is free for non-commercial usage.  For commercial usage, see https://www.un4seen.com for licensing information.

To import a package into your app using Xcode, see the guidance provided by Apple at https://developer.apple.com/documentation/xcode/adding-package-dependencies-to-your-app .
The repostory URL you will need is:  https://github.com/Treata11/CBass .

A pop-up window will appear allowing you to choose whichever package products you wish to install.  The CBass package products include: Bass, BassApe, BassDSD, BassENC, BassENC.FLAC, BassENC.MP3, BassENC.OGG, BassENC.Opus, Bass FLAC, BassFX, BassHLS, BassLoud, BassMIDI, BassMPC, BassMix, BassOpus, BassSPX, and BassTTA.  In this project, we installed just the first one.

Then, remember to add "import Bass" to the top of any Swift file using any BASS commands.

To enable live microphone input, check the "Resource Access: Audio Input" box in the SwiftCBassDemo TARGET, "Signing & Capabilites" heading, "All" subheading, "Hardened Runtime" section.  
Also, you must add a "Privacy - Microphone Usage Description" (such as "This app analyzes audio from the microphone."  Add this in the SwiftBassDemo TARGET, Info heading, "Custom Application Target Properties" section.
