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
    public let meta: Meta
    public let track: TrackAnalysis
    public let bars, beats, tatums: [Bar]
    public let sections: [[String: Double]]
    public let segments: [Segment]
}

// MARK: - Bar
public struct Bar: Codable {
    public let start, duration, confidence: Double
}

// MARK: - Meta
public struct Meta: Codable {
    public let analyzerVersion, platform, detailedStatus: String
    public let statusCode, timestamp: Int
    public let analysisTime: Double
    public let inputProcess: String

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
    public let start, duration, confidence, loudnessStart: Double
    public let loudnessMaxTime, loudnessMax: Double
    public let pitches, timbre: [Double]
    public let loudnessEnd: Int?

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
    public let numSamples: Int
    public let duration: Double
    public let sampleMd5: String
    public let offsetSeconds, windowSeconds, analysisSampleRate, analysisChannels: Int
    public let endOfFadeIn, startOfFadeOut, loudness, tempo: Double
    public let tempoConfidence: Double
    public let timeSignature: Int
    public let timeSignatureConfidence: Double
    public let key: Int
    public let keyConfidence: Double
    public let mode: Int
    public let modeConfidence: Double
    public let codestring: String
    public let codeVersion: Double
    public let echoprintstring: String
    public let echoprintVersion: Double
    public let synchstring: String
    public let synchVersion: Int
    public let rhythmstring: String
    public let rhythmVersion: Int

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

