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
  
    
    override func viewDidLoad() {
        
        self._previewView = previewView
        
        super.viewDidLoad()
        
        
        
    }
    
    
    @IBAction func recordBtnPressed(_ sender: AnyObject) {
        self.toggleMovieRecording()
    }
    
    @IBAction func channgeCameraBtnPressed(_ sender: AnyObject) {
        self.changeCamera()
    }
    
}

