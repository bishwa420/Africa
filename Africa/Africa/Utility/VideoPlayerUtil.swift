//
//  VideoPlayerUtil.swift
//  Africa
//
//  Created by Bishwajit Purkaystha on 30/11/22.
//

import AVKit
import Foundation

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
    if Bundle.main.url(
        forResource: fileName,
        withExtension: fileFormat) != nil {
        videoPlayer = AVPlayer(
            url: Bundle.main.url(
                forResource: fileName,
                withExtension: fileFormat
            )!
        )
        videoPlayer?.play()
    }
    return videoPlayer!
}
