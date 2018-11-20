//
//  GameScene.swift
//  4Memory
//
//  Created by Adem Gunduz on 17-09-18.
//  Copyright © 2018 Adem Gunduz. All rights reserved.
//
import UIKit
import SpriteKit
import GameplayKit

var hexCar:[Character] = ["1", "2", "3", "a", "b", "c", "d", "e", "f", "4", "5", "6", "7", "8", "9", "0"]
var cv:[String] = []
var tt = "#"

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

//let color = UIColor(hexString: tt)
var shapes: [SKShapeNode] = []
var coloR = Color()
var appear: SKAction!
var disappear: SKAction!
var wait: SKAction!
var wait1: SKAction!
var actions: [SKAction] = []
var tc: Bool = true
class GameScene: SKScene {
    var background: SKSpriteNode!
    
    //var randomShapes: [SKShapeNode] = []
    var touched: [SKShapeNode] = []
    var TimerLabel: SKLabelNode!
    var c = Bool()
    var color: UIColor!
    
    
    var Shape1 = SKShapeNode(rectOf: CGSize(width: 420, height: 420), cornerRadius: 10.0)
    var Shape2 = SKShapeNode(rectOf: CGSize(width: 420, height: 420), cornerRadius: 10.0)
    var Shape3 = SKShapeNode(rectOf: CGSize(width: 420, height: 420), cornerRadius: 10.0)

    var Shape4 = SKShapeNode(rectOf: CGSize(width: 420, height: 420), cornerRadius: 10.0)
    var Shape5 = SKShapeNode(rectOf: CGSize(width: 420, height: 420), cornerRadius: 10.0)
    var Shape6 = SKShapeNode(rectOf: CGSize(width: 420, height: 420), cornerRadius: 10.0)
    
    override func didMove(to view: SKView) {
        
        for _ in 1...6 {
            //cv.append(hexCar.randomElement() ?? "0")
            tt.insert(hexCar.randomElement()!, at: tt.endIndex)
        }
        color = UIColor(hexString: tt)        // let c = GameScene()
       // een.xScale = 100
        //een.yScale = 200
        //var shapes : [SKShapeNode] = [Shape1, Shape2]
        ////////////////////////////
        var vb = Light()
        let actionwait = SKAction.wait(forDuration: 0.5)

        let actionrun = SKAction.run({
            
            vb.current += 1
            
            if vb.current == 9 {self.c = true}

            
            self.TimerLabel.text = " \(vb.current)"
            
        })
       
        ////////////////////////////////////////////////////////////////////////
        TimerLabel = AddDigit(DigitName: "Helvetica", DigitPosition: CGPoint(x: 400, y: 750)).label
        TimerLabel.isUserInteractionEnabled = true
        addChild(TimerLabel)
        
        TimerLabel.run(SKAction.repeatForever(SKAction.sequence([actionwait,actionrun])))
        
        Shape1.strokeColor = .brown
        //Shape1.fillColor = color
        Shape1.lineWidth = 20
        Shape1.position = CGPoint(x: 230, y: 0)
        Shape1.name = "1"
        //Shape1.setScale(0.8)
        addChild(Shape1)
        
        Shape2.strokeColor = .brown
        //Shape2.fillColor = color
        Shape2.lineWidth = 20
        Shape2.position = CGPoint(x: 230, y: 500)
        Shape2.name = "2"
        addChild(Shape2)
        
        Shape3.strokeColor = .brown
        //Shape3.fillColor = .blue
        Shape3.lineWidth = 20
        Shape3.position = CGPoint(x: 230, y: -500)
        Shape3.name = "3"
        addChild(Shape3)
        
        Shape4.strokeColor = .brown
        //Shape4.fillColor = .blue
        Shape4.lineWidth = 20
        Shape4.position = CGPoint(x: -230, y: 0)
        Shape4.name = "4"
        addChild(Shape4)
        
        Shape5.strokeColor = .brown
        //Shape5.fillColor = .blue
        Shape5.lineWidth = 20
        Shape5.position = CGPoint(x: -230, y: 500)
        Shape5.name = "5"
        addChild(Shape5)
        
        Shape6.strokeColor = .brown
        //Shape6.fillColor = .blue
        Shape6.lineWidth = 20
        Shape6.position = CGPoint(x: -230, y: -500)
        Shape6.name = "6"
        addChild(Shape6)
        
        background = SKSpriteNode(imageNamed: "math")
        background.size = CGSize(width: 1536, height: 2048)
        ///background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        background.position = CGPoint.zero
        background.zPosition = -1
        ///background.zRotation = CGFloat(3.14) / 16
        background.isUserInteractionEnabled = true
        addChild(background)
        
        shapes = [Shape1, Shape2, Shape3, Shape5, Shape6, Shape4].shuffled()
        
        appear = SKAction.scale(to: 1.0, duration: 0.2)
        wait = SKAction.wait(forDuration: 2.0)
        wait1 = SKAction.wait(forDuration: 2.0)
        disappear = SKAction.scale(to: 0.8, duration: 0.2)
        //appear.timingFunction = {
           // i in return i*i*i*i
        //}
        //let removeFromParent = SKAction.removeFromParent()
        actions = [wait, disappear, wait1, appear]
        act()
    }
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            
       for _ in touches {
           // een.fillColor = .green
        let touch: UITouch = touches.first!
        let location = touch.location(in: self)
        let TouchedNode = self.atPoint(location)
        print(TouchedNode.name ?? "??")
        let FadeAway = SKAction.fadeOut(withDuration: 0.25)
        let RemoveNode = SKAction.removeFromParent()
        let sequence = SKAction.sequence([FadeAway, RemoveNode])
        TouchedNode.run(sequence)
        
        if TouchedNode.name == shapes[0].name {
            print("ok")
            shapes.removeFirst()
            guard !shapes.isEmpty else {
                print("-----")
                return
            }
        } else {
            if let view = self.view {
                // Load the SKScene from 'GameScene.sks'
                if let scene = SKScene(fileNamed: "Level1") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view.presentScene(scene)
                }
                
                view.ignoresSiblingOrder = true
                
                view.showsFPS = true
                view.showsNodeCount = true
                }
            }
        }
    }
}
