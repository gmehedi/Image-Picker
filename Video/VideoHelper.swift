//
//  VideoHelper.swift
//  TurnToLive
//
//  Created by sadidur rahman on 10/2/20.
//  Copyright © 2020 Matrix Solution Ltd. All rights reserved.
//

import UIKit
import MobileCoreServices
import AVFoundation

class VideoHelper {
    static func startMediaBrowser(delegate: UIViewController & UINavigationControllerDelegate & UIImagePickerControllerDelegate, sourceType: UIImagePickerController.SourceType) {
    guard UIImagePickerController.isSourceTypeAvailable(sourceType) else { return }
    
    let picker = UIImagePickerController()
    picker.sourceType = sourceType
    picker.mediaTypes = [kUTTypeMovie as String]
    picker.allowsEditing = true
    picker.delegate = delegate
    delegate.present(picker, animated: true, completion: nil)
  }
}
