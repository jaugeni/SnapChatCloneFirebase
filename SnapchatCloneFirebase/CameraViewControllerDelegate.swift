//
//  CameraViewControllerDelegate.swift
//  SnapchatCloneFirebase
//
//  Created by YAUHENI IVANIUK on 2/10/17.
//  Copyright © 2017 YauheniIvaniuk. All rights reserved.
//

import Foundation

protocol CameraViewControllerDelegate {
    
    func shouldEnableRecordUI(enabled: Bool)
    func shouldEnableCameraUI(enabled: Bool)
    func canStartRecording()
    func recordingHasStarted()
    func videoRecordingComplete(videoURL: NSURL)
    func videoRecordingFailed()
    func snapshotTaken(snapshotData: NSData)
    func snapshotFailed()
    
}
