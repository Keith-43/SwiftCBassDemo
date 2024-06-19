/*
 AudioManager.swift
 SwiftCBassDemo
 
 Created by Keith Bromley and Treata Nourizi in June 2024.
 
 Abstract:
 The AudioManager class handles the playing, capture, and processing of audio data in real time.
 This version of the AudioManager uses the BASS audio library from [un4seen](https://www.un4seen.com) .
*/

import Accelerate
import Observation
import Bass
// import CBass


@Observable
class AudioManager {

    static let shared = AudioManager()      // This singleton instantiates the AudioManager class and runs setupAudio()

    let timeInterval: Double = 1.0 / 60.0        // 60 frames per second
    var micOn: Bool = false
    var stream: HSTREAM = 0

    // Play this song when the SwiftBassDemo app starts:
    let filePath = Bundle.main.path(forResource: "music", ofType: "mp3")

    // Declare an array of the final values (for this frame) that we will publish to the visualization:
    private(set) var spectrum: [Float] = [Float]( repeating: 0.0, count: 16384 / 2 )    // binCount = 8,192

    init() {
        setupAudio()
    }


    func setupAudio(){

        // print(micOn)
        print( BASS_GetVersion() )   // This prints "33_820_928" in Xcode's console pane

        // Initialize the output device (i.e., speakers) that BASS should use:
        BASS_Init(  -1,         // device: -1 is the default device
                     44100,     // freq: output sample rate is 44,100 sps
                     0,         // flags:
                     nil,       // win: 0 = the desktop window (use this for console applications)
                     nil)       // Unused, set to nil
        // The sample format specified in the freq and flags parameters has no effect on the output on macOS or iOS.
        // The device's native sample format is automatically used.

        if(micOn == true) {

            // Initialize the input device (i.e., microphone) that BASS should use:
            BASS_RecordInit(-1)     // device = -1 is the default input device

            stream = BASS_RecordStart(  44100,          // freq: the sample rate to record at
                                        1,              // chans: number of audio channels, 1 = mono
                                        0,              // flags:
                                        myRecordProc,   // callback process:
                                        nil)            // user:

            func myRecordProc(_: HRECORD, _: UnsafeRawPointer?, _: DWORD, _: UnsafeMutableRawPointer?) -> BOOL32{
                return BOOL32(truncating: true)     // continue recording
            }

        } else {

            // Create a sample stream from our MP3 song file:
            stream = BASS_StreamCreateFile( BOOL32(truncating: false),  // mem: false = stream the file from a filename
                                            filePath,                   // file:
                                            0,                          // offset:
                                            0,                          // length: 0 = use all data up to end of file
                                            0)                          // flags:

            BASS_ChannelPlay(stream, -1) // starts the output
        }

        // Compute the 8192-bin spectrum of the song waveform every 1/60 seconds:
        Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { time in
            BASS_ChannelGetData(self.stream, &self.spectrum, BASS_DATA_FFT16384)
        }
    }


    func stopMusicPlay() {
        BASS_Stop()
        BASS_Free() }
}

