//
//  AVPlayerView.swift
//  TurnToLive
//
//  Created by sadidur rahman on 13/2/20.
//  Copyright © 2020 Matrix Solution Ltd. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class AVPlayerView: UIView {
    override class var layerClass: AnyClass {
        return AVPlayerLayer.self
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: layer)
        guard layer == self.layer else {
            return
        }
        layer.frame = self.frame
    }
}
