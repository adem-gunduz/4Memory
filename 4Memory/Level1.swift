//
//  Level1.swift
//  4Memory
//
//  Created by A dem Gunduz on 20-10-18.
//  Copyright © 2018 Adem Gunduz. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit
var ty: SKShapeNode!

class Level1: SKScene {
    var b = GameScene()
    override func didMove(to view: SKView) {
        b.Shape1.fillColor = coloR.color
        b.Shape1.name = "11"
        addChild(b.Shape1)
        ty = childNode(withName: "shape") as? SKShapeNode
        ty.fillColor = coloR.color
        //addChild(ty)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for _ in touches {
            // een.fillColor = .green
            let touch: UITouch = touches.first!
            let location = touch.location(in: self)
            let TouchedNode = self.atPoint(location)
            print(TouchedNode.name ?? "//")
            b.Shape1.fillColor = coloR.color
            if TouchedNode.name == "shape" {
                ty.removeFromParent()
                print("removed")
            }
        }
        
        
    }
}
