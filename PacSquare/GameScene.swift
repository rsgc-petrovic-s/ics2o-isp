//
//  GameScene.swift
//  PacSquare
//
//  Created by Stefan Petrovic on 2016-11-24.
//  Copyright (c) 2016 Stefan Petrovic. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    //add Koala
    let koala = SKSpriteNode(imageNamed:"koala")
    
    override func didMove(to view: SKView) {
        
        //space background
        let background = SKSpriteNode(imageNamed:"space")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        background.size = self.frame.size
        background.zPosition = -1
        addChild(background)
        
        //position of koala
        koala.position = CGPoint(x: size.width / 2, y: size.height / 2)
        koala.size = CGSize(width: 90, height: 140)
        addChild(koala)
        spawnPellet()
        spawnBarrier()
        spawnMonster()
        
        
    }
    
    
    //touch commands
    //touch commands
    
    //method responds to a single touch
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?){
        guard let touch = touches.first else{
            return
        }
        let touchLocation = touch.location(in: self)
        
        
        //print location of touch out in console
        print(touchLocation.x)
        print(touchLocation.y)
        
        
        
        
        
        //koala lines of code
        //koala lines of code
        
        //make koala move horizontally
        let destination = CGPoint(x: touchLocation.x, y: touchLocation.y)
        
    
        
        //create action
        let actionMove = SKAction.move(to: destination, duration: 1)
        
        
        //tell koala to move
        koala.run(actionMove)
    
        
        
        
        
        
        
        
        //monster lines of code
        //monster lines of code
    }
    func spawnMonster(){
        let monster = SKSpriteNode(imageNamed:"monster")
        monster.setScale(2.7)
        let startingPosition = CGPoint(x: size.width / 2, y: size.height / 2)
        monster.position = startingPosition
        addChild(monster)
        
    }

    
    
    //pellet lines of code
    
    //spawning a single pellet
    func spawnPellet (){
        let pellet = SKSpriteNode(imageNamed: "pellet")
        //randomize horizontal position of the pellet
        let horizontalPosition = CGFloat(arc4random_uniform(UInt32(size.width - 256 ))) + 128
        
        //randomize veritcal position of the pellet
        let verticalPosition = CGFloat(arc4random_uniform(UInt32(size.height - 256))) + 128
        
        let startingPosition = CGPoint(x: horizontalPosition, y: verticalPosition)
        pellet.position = startingPosition
        pellet.size = CGSize(width: 50, height: 50)
        
        addChild(pellet)
        
    }
    
    
    
    //barrier lines of code
    
    func spawnBarrier (){

        
        // Left edge barriers
        for column in 1...12{
            let barrier = SKSpriteNode(imageNamed: "barrier")
            barrier.anchorPoint = CGPoint(x: 0, y: 0)
            
            
            let startingPosition = CGPoint(x: -25, y: 128 * column)
            
            barrier.position = startingPosition
            barrier.size = CGSize(width: 128, height: 128)
            barrier.setScale(2.0)
            addChild(barrier)
            
        }

        // Left edge barriers
        for column in 1...12{
            let barrier = SKSpriteNode(imageNamed: "barrier")
            barrier.anchorPoint = CGPoint(x: 0, y: 0)
            
            
            let startingPosition = CGPoint(x: -25, y: 128 * column)
            
            barrier.position = startingPosition
            barrier.size = CGSize(width: 128, height: 128)
            barrier.setScale(2.0)
            addChild(barrier)
            
           

        }
        // right edge barriers
        for column in 1...12{
            let barrier2 = SKSpriteNode(imageNamed: "barrier")
            barrier2.anchorPoint = CGPoint(x: 0, y: 0)
            
            
            let startingPosition = CGPoint(x: 1890, y: 128 * column)
            
            barrier2.position = startingPosition
            barrier2.size = CGSize(width: 128, height: 128)
            barrier2.setScale(2.0)
            addChild(barrier2)
            
        }
        
        // top  edge barriers
        for row in 1...17{
            let barrier3 = SKSpriteNode(imageNamed: "barrier")
            barrier3.anchorPoint = CGPoint(x: 0, y: 0)
            
            
            let startingPosition = CGPoint(x: 105 * row - 10, y: 1153)
            
            barrier3.position = startingPosition
            barrier3.size = CGSize(width: 128, height: 128)
            barrier3.setScale(2.0)
            addChild(barrier3)
            
        }
        
        // bottom  edge barriers
        for row in 1...17{
            let barrier4 = SKSpriteNode(imageNamed: "barrier")
            barrier4.anchorPoint = CGPoint(x: 0, y: 0)
            
            
            let startingPosition = CGPoint(x: 105 * row - 10, y: 128)
            
            barrier4.position = startingPosition
            barrier4.size = CGSize(width: 128, height: 128)
            barrier4.setScale(2.0)
            addChild(barrier4)
            
        }
    }
    
}
