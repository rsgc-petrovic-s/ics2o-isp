//
//  GameViewController.swift
//  PacSquare
//
//  Created by Stefan Petrovic on 2016-11-24.
//  Copyright (c) 2016 Stefan Petrovic. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scene = GameScene(size: CGSize(width: 2048, height: 1536))
        
        //configure of scene
        let skView = self.view as! SKView
        skView.showsFPS = true
        skView.showsNodeCount = true
        
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
}
