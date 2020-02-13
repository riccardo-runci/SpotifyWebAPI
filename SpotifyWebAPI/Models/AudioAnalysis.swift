//
//  AudioAnalysis.swift
//  SpotifyWebAPI
//
//  Created by Riccardo Runci on 12/02/2020.
//  Copyright © 2020 Riccardo Runci. All rights reserved.
//

// To parse the JSON, add this file to your project and do:
//
//   let audioAnalysis = try? newJSONDecoder().decode(AudioAnalysis.self, from: jsonData)


// MARK: - AudioAnalysis
public struct AudioAnalysis: Codable {
    let meta: Meta
    let track: TrackAnalysis
    let bars, beats, tatums: [Bar]
    let sections: [[String: Double]]
    let segments: [Segment]
}

// MARK: - Bar
public struct Bar: Codable {
    let start, duration, confidence: Double
}

// MARK: - Meta
public struct Meta: Codable {
    let analyzerVersion, platform, detailedStatus: String
    let statusCode, timestamp: Int
    let analysisTime: Double
    let inputProcess: String

    enum CodingKeys: String, CodingKey {
        case analyzerVersion = "analyzer_version"
        case platform
        case detailedStatus = "detailed_status"
        case statusCode = "status_code"
        case timestamp
        case analysisTime = "analysis_time"
        case inputProcess = "input_process"
    }
}

// MARK: - Segment
public struct Segment: Codable {
    let start, duration, confidence, loudnessStart: Double
    let loudnessMaxTime, loudnessMax: Double
    let pitches, timbre: [Double]
    let loudnessEnd: Int?

    enum CodingKeys: String, CodingKey {
        case start, duration, confidence
        case loudnessStart = "loudness_start"
        case loudnessMaxTime = "loudness_max_time"
        case loudnessMax = "loudness_max"
        case pitches, timbre
        case loudnessEnd = "loudness_end"
    }
}

// MARK: - Track
public struct TrackAnalysis: Codable {
    let numSamples: Int
    let duration: Double
    let sampleMd5: String
    let offsetSeconds, windowSeconds, analysisSampleRate, analysisChannels: Int
    let endOfFadeIn, startOfFadeOut, loudness, tempo: Double
    let tempoConfidence: Double
    let timeSignature: Int
    let timeSignatureConfidence: Double
    let key: Int
    let keyConfidence: Double
    let mode: Int
    let modeConfidence: Double
    let codestring: String
    let codeVersion: Double
    let echoprintstring: String
    let echoprintVersion: Double
    let synchstring: String
    let synchVersion: Int
    let rhythmstring: String
    let rhythmVersion: Int

    enum CodingKeys: String, CodingKey {
        case numSamples = "num_samples"
        case duration
        case sampleMd5 = "sample_md5"
        case offsetSeconds = "offset_seconds"
        case windowSeconds = "window_seconds"
        case analysisSampleRate = "analysis_sample_rate"
        case analysisChannels = "analysis_channels"
        case endOfFadeIn = "end_of_fade_in"
        case startOfFadeOut = "start_of_fade_out"
        case loudness, tempo
        case tempoConfidence = "tempo_confidence"
        case timeSignature = "time_signature"
        case timeSignatureConfidence = "time_signature_confidence"
        case key
        case keyConfidence = "key_confidence"
        case mode
        case modeConfidence = "mode_confidence"
        case codestring
        case codeVersion = "code_version"
        case echoprintstring
        case echoprintVersion = "echoprint_version"
        case synchstring
        case synchVersion = "synch_version"
        case rhythmstring
        case rhythmVersion = "rhythm_version"
    }
}

