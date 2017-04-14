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
    var score = [Int]()
    
    
    override func didMove(to view: SKView) {
        
        startGame()
        
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
    
    
    func startGame(){
        
        score = [0,0]
    }
    
    func addScore(playerwhoWon: SKSpriteNode){
        
        ball.position = CGPoint(x: 0, y: 0)
        //ball.physicsBody?.velocity = CGVector(dx: 10, dy: 10)
        
        if playerwhoWon == main {
            score[0] += 1
              ball.physicsBody?.applyImpulse(CGVector(dx: 20, dy:20))
        }
        else if playerwhoWon == enemy {
            score[1] += 1
              ball.physicsBody?.applyImpulse(CGVector(dx: -20, dy: -20))
        }
        print(score)
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        for touch in touches {
            let location = touch.location(in: self)  // grab location of finger inside view
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches {
            let location = touch.location(in: self)  // grab location of finger inside view
            
            main.run(SKAction.moveTo(x: location.x, duration: 0.2))
        }
        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        //moving enemy
        enemy.run(SKAction.moveTo(x: ball.position.x, duration: 1.0))
        
        if ball.position.y <= main.position.y - 70 {
            addScore(playerwhoWon: enemy)
            
        }
        else if ball.position.y >= main.position.y + 70 {
            addScore(playerwhoWon: main)
        }
        
        
        
        
    }
}
