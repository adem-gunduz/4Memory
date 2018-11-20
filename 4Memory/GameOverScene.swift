//
//  GameOverScene.swift
//  4Memory
//
//  Created by Adem Gunduz on 10-10-18.
//  Copyright © 2018 Adem Gunduz. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
import GameplayKit

class GameOverScene: SKScene {
    var HscoreLabel: SKLabelNode!
    
    override func didMove(to view: SKView) {
        
        //view.backgroundColor = .blue
        scene?.backgroundColor = coloR.color
        
        HscoreLabel = AddDigit(DigitName: "Helvetica-Bold", DigitPosition: CGPoint(x: 0, y: 447)).label
        HscoreLabel.text = "BEST"
        HscoreLabel.fontSize = 100
        HscoreLabel.fontColor = UIColor.purple
        addChild(HscoreLabel)
        
    }
}
