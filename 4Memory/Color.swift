//
//  Color.swift
//  4Memory
//
//  Created by A dem Gunduz on 13-10-18.
//  Copyright © 2018 Adem Gunduz. All rights reserved.
//

import Foundation
import UIKit
import SpriteKit

func act() {
    for shapes in shapes {
        shapes.fillColor = coloR.color
        shapes.isUserInteractionEnabled = false
        wait.duration += 1
        shapes.run(SKAction.sequence(actions))
    }
}
func act1() {
    for shapes in shapes {
        //shapes.fillColor = coloR.color
        //shapes.isUserInteractionEnabled = true
        //wait.duration += 1
        //shapes.run(SKAction.sequence(actions))
    }
}
