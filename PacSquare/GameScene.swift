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
    
    //Label and variable to track score
    let scoreLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
    var score = 0 //tracks current score
    
    
    
    
    
    override func didMove(to view: SKView) {
        
        //space background
        let background = SKSpriteNode(imageNamed:"space")
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        background.size = self.frame.size
        background.zPosition = -1
        addChild(background)
        
        //position of koala
        koala.position = CGPoint(x: 500, y: 500)
        koala.size = CGSize(width: 90, height: 140)
        
        addChild(koala)
        spawnPellet()
        spawnBarrier()
        spawnMonster()
        //add heads up display to show the score
        scoreLabel.text = String(score)
        scoreLabel.fontColor = SKColor.yellow
        scoreLabel.fontSize = 96
        scoreLabel.zPosition = 150 //make sure that the HUD is not under other nodes
        scoreLabel.position = CGPoint(x: size.width - size.width / 8, y: size.height - size.height / 4)
        addChild(scoreLabel)
        }
    
    
    // This is a function that runs every tie SpriteKit updates the game frame
    override func update(_ currentTime: TimeInterval) {
        //check for collisions between koala and other objects
        checkCollisions()
        checkCollisions2()
        checkCollisions3()
    }
    
    //touch commands
    //touch commands
    
    //method responds to a single touch
    
    //Func that runs every time spritekit updates the game frame
    
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
    let monster = SKSpriteNode(imageNamed:"monster")
  
    
    
    
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
        pellet.name = "pellet"
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
            barrier.name = "barrier"
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
            barrier.name = "barrier"
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
            barrier2.name = "barrier"
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
            barrier3.name = "barrier"
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
            barrier4.name = "barrier"
            addChild(barrier4)
            
        }
    }
    
    
    // HITBOX LINES OF CODE
    //This function checks for collisions between Koala and Monster
    
    func checkCollisions() {
        
        // create emety list (array) that will contain all obstacles colliding with Santa
        var hitMonsters : [SKSpriteNode] = []
        
        // Code to find all obstacles currently colliding with Koala
        enumerateChildNodes(withName: "monster", using: {
            node, _ in
            
            // get a reference to current node that was found with name "monster"
            
            let monster = node as! SKSpriteNode
            
            // Check to see if the koala is intersecting with koala
            if monster.frame.insetBy(dx: 20, dy: 20).intersects(self.koala.frame.insetBy(dx: 40, dy: 40)) {
                
                // This monster intersects with koala
                hitMonsters.append(monster)
                
            }
        })
        
        //loop over all the obstacles collding with koala
        for monster in hitMonsters {
            koalaHit(by: monster)
            
        }
    }
    // this functions removes monster from game
    func koalaHit(by monster: SKSpriteNode) {
        
        // remove monster from scene
        koala.removeFromParent()
    }
    func checkCollisions2() {
        
        // create emety list (array) that will contain all obstacles colliding with Santa
        var hitPellet : [SKSpriteNode] = []
        
        // Code to find all obstacles currently colliding with Koala
        enumerateChildNodes(withName: "pellet", using: {
            node, _ in
            
            // get a reference to current node that was found with name "monster"
            
            let pellet = node as! SKSpriteNode
            
            
            
            // Check to see if the koala is intersecting with koala
            if pellet.frame.intersects(self.koala.frame) {
                
                
                self.score += 1
                self.scoreLabel.text = String(self.score)
                // This monster intersects with koala
                pellet.removeFromParent()
                self.spawnPellet()
                
            }
        })
        
        
    }
    func spawnMonster(){
        
        self.monster.setScale(2.7)
        
        
        let startingPosition = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        self.monster.position = startingPosition
        //give the monster a name
        self.monster.name = "monster"
        self.addChild(self.monster)
    }
    func checkCollisions3() {
        
       
        
        // create emety list (array) that will contain all obstacles colliding with Santa
        var hitBarrier : [SKSpriteNode] = []
        
        // Code to find all obstacles currently colliding with Koala
        enumerateChildNodes(withName: "barrier", using: {
            node, _ in
            
            // get a reference to current node that was found with name "monster"
            
            let barrier = node as! SKSpriteNode
            
            
            
            // Check to see if the koala is intersecting with koala
            
          
            
            let horizontalPosition = CGFloat(arc4random_uniform(UInt32(self.size.width)))
           
            
            
            let verticalPosition = CGFloat(arc4random_uniform(UInt32(self.size.height)))
            
            
            
            
            let endingPosition = CGPoint(x: horizontalPosition, y: verticalPosition)
            
                let actionMove = SKAction.move(to: endingPosition, duration: 3)
            
            self.monster.run(actionMove)
            if barrier.frame.intersects(self.monster.frame) {
                print("2")
                
            
                // This monster intersects with koala
                let horizontalPosition = CGFloat(arc4random_uniform(UInt32(self.size.width)))
                
                let verticalPosition = CGFloat(arc4random_uniform(UInt32(self.size.height)))
                
                
                
                
                let endingPosition = CGPoint(x: horizontalPosition, y: verticalPosition)
                
                let actionMove = SKAction.move(to: endingPosition, duration: 3)
                self.monster.run(actionMove)
                
                
            }
            
        })
        
        
    }
    
}
