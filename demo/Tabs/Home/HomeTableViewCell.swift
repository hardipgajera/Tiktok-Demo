//
//  HomeTableViewCell.swift
//  KD Tiktok-Clone
//
//  Created by Sam Ding on 9/8/20.
//  Copyright © 2020 Kaishan. All rights reserved.
//

import UIKit
import MarqueeLabel
import AVFoundation

class HomeTableViewCell: UITableViewCell {
    
    var playerView: VideoPlayerView!
    
    private(set) var isPlaying = false
    
    override func prepareForReuse() {
        super.prepareForReuse()
        playerView.cancelAllLoadingRequest()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
        playerView = VideoPlayerView(frame: self.contentView.frame)
        
        
        contentView.addSubview(playerView)
        contentView.sendSubviewToBack(playerView)
    }
    
    
    func configure(url: URL, fileExtension: String, width: Int, height: Int) {
        playerView.configure(url: url, fileExtension: fileExtension, size: (width, height))
    }
    
    func play() {
        if !isPlaying {
            playerView.play()
            isPlaying = true
        }
    }
    
    func pause(){
        if isPlaying {
            playerView.pause()
            isPlaying = false
        }
    }
    
    func replay(){
        if !isPlaying {
            playerView.replay()
            play()
        }
    }
}
