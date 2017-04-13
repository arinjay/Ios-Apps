//
//  GameScene.swift
//  Pong
//
//  Created by Arinjay Sharma on 4/7/17.
//  Copyright © 2017 Arinjay Sharma. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var ball = SKSpriteNode()
    var enemy = SKSpriteNode()
    var main = SKSpriteNode()
    
    
    override func didMove(to view: SKView) {
        
        ball = self.childNode(withName: "ball") as! SKSpriteNode
        enemy = self.childNode(withName: "enemy") as! SKSpriteNode
        main = self.childNode(withName: "main") as! SKSpriteNode
        
        
        //  angle of
        ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy:20))
        
        //create border around scene
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 1
        self.physicsBody = border
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
