//
//  PassVideoVC.swift
//  Image Picker
//
//  Created by Mehedi on 2/14/20.
//  Copyright © 2020 MatrixSolution. All rights reserved.
//

import UIKit
import AVFoundation

class PassVideoVC: UIViewController {
    
    @IBOutlet weak var playerView: AVPlayerView!
    
    var selectedData: URL?
    // TODO: jfdhgjdhfghsdfds
    // MARK: sdddasdas
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       // print(selectedData)
        let videoURL = NSURL(string: String("\(selectedData!)"))
        let playerAV = AVPlayer(url: videoURL! as URL)
        let playerLayerAV = AVPlayerLayer(player: playerAV)
        playerLayerAV.videoGravity = .resize
        playerLayerAV.frame = self.playerView.bounds
        self.playerView.layer.addSublayer(playerLayerAV)
        playerAV.play()
    }

}
