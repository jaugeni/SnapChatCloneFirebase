//
//  CameraVC.swift
//  SnapchatCloneFirebase
//
//  Created by YAUHENI IVANIUK on 1/20/17.
//  Copyright © 2017 YauheniIvaniuk. All rights reserved.
//

import UIKit
import FirebaseAuth

@available(iOS 10.2, *)
class CameraVC: CameraViewController, CameraViewControllerDelegate {
    
    
    @IBOutlet weak var previewView: PreviewView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        
        delegate = self
        self._previewView = previewView
        
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        guard FIRAuth.auth()?.currentUser != nil else {
            performSegue(withIdentifier: "LoginVC", sender: nil)
            return
        }
    }
    
    
    @IBAction func recordBtnPressed(_ sender: AnyObject) {
        toggleMovieRecording()
    }
    
    @IBAction func channgeCameraBtnPressed(_ sender: AnyObject) {
        changeCamera()
    }
    
    func shouldEnableCameraUI(enabled: Bool) {
        cameraButton.isEnabled = enabled
        print("should enable camera ui: \(enabled)")
    }
    
    func shouldEnableRecordUI(enabled: Bool) {
        recordButton.isEnabled = enabled
        print("should enable record ui: \(enabled)")
    }
    
    func recordingHasStarted() {
        print("recording has started")
    }
    
    func canStartRecording() {
        print("can start recording")
        
    }
    
    func videoRecordingComplete(videoURL: NSURL) {
        performSegue(withIdentifier: "UsersVC", sender: ["videoURL":videoURL])
    }
    
    func videoRecordingFailed() {
        
    }
    
    func snapshotTaken(snapshotData: NSData) {
        performSegue(withIdentifier: "UsersVC", sender: ["snapshotData":snapshotData])
    }
    
    func snapshotFailed() {
        
    }
    
}

