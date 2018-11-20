//
//  AddNode.swift
//  4Memory
//
//  Created by A dem Gunduz on 09-10-18.
//  Copyright © 2018 Adem Gunduz. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

public struct AddDigit {
    
    var DigitName: String
    var DigitPosition: CGPoint
    var digit: SKSpriteNode {
        let d = SKSpriteNode(imageNamed: DigitName)
        d.position = DigitPosition
        d.name = DigitName
        d.size = CGSize(width: 230.4, height: 230.4)
        return d
    }
    var label: SKLabelNode {
        let l = SKLabelNode(fontNamed: DigitName)
        l.text = "00"
        l.position = DigitPosition
        l.fontSize = 260
        return l
    }
}

struct Color {
var color: UIColor {
    var hexstring = "#"
    
    for _ in 1...6 {
        //cv.append(hexCar.randomElement() ?? "0")
       hexstring.insert(hexCar.randomElement()!, at: hexstring.endIndex)
    }
    let c = UIColor(hexString: hexstring)
    return c
    }
}

struct Light {
    static let maxCurrent = 18
    var current = 0 {
        
        didSet {
            if current>Light.maxCurrent {
                print("Current too high, falling back to previous setting.")
                current = 0
            }
            if current == 7 {
                print("7777")
                //tc.toggle()
                act1()
            }
            
        }
    }
}
