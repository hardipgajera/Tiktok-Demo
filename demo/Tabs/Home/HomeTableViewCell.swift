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
    
    @IBOutlet weak var musicLbl: MarqueeLabel!
    
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
        self.playerView = VideoPlayerView(frame: self.contentView.frame)
        self.musicLbl.holdScrolling = true
        self.musicLbl.animationDelay = 0
        
        self.contentView.addSubview(self.playerView)
        self.contentView.sendSubviewToBack(self.playerView)
    }
    
    func configure(url: URL, fileExtension: String, width: Int, height: Int) {
        playerView.configure(url: url, fileExtension: fileExtension, size: (width, height))
    }
    
    func play() {
        if !isPlaying {
            playerView.play()
            musicLbl.holdScrolling = false
            isPlaying = true
        }
    }
    
    func pause(){
        if isPlaying {
            playerView.pause()
            musicLbl.holdScrolling = true
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
