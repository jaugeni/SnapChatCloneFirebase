//
//  CameraVC.swift
//  SnapchatCloneFirebase
//
//  Created by YAUHENI IVANIUK on 1/20/17.
//  Copyright © 2017 YauheniIvaniuk. All rights reserved.
//

import UIKit

class CameraVC: CameraViewController {
    
    
    @IBOutlet weak var previewView: PreviewView!
    @IBOutlet weak var cameraButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    
    override func viewDidLoad() {
        
        self._previewView = previewView
        _recordButton = recordButton
        _cameraButton = cameraButton
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func recordBtnPressed(_ sender: Any) {
        toggleMovieRecording()
    }
    
    @IBAction func channgeCameraBtnPressed(_ sender: Any) {
        changeCamera()
    }
    
}

