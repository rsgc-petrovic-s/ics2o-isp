
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
    var border = SKNode()
    
    //Label and variable to track score
    let scoreLabel = SKLabelNode(fontNamed: "Helvetica-Bold")
    var score = 0 //tracks current score
    
    //Label for Game Over Scene
    let gameOver1 = SKLabelNode(fontNamed: "Helvetica-Bold")
    let gameOver2 = ("Game Over :(")
    
    //label for Win Scene
    let Win1 = SKLabelNode(fontNamed: "Helvetica-Bold")
    let Win2 = ("You Win :D")
    
    
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
        spawnMonster()
        
        //add heads up display to show the score
        scoreLabel.text = String(score)
        scoreLabel.fontColor = SKColor.yellow
        scoreLabel.fontSize = 96
        scoreLabel.zPosition = 150 //make sure that the HUD is not under other nodes
        scoreLabel.position = CGPoint(x: size.width - size.width / 8, y: size.height - size.height / 4)
        addChild(scoreLabel)
        
        
        //add heads up display to show when you win the game
        gameOver1.text = String(gameOver2)
        gameOver1.fontColor = SKColor.yellow
        gameOver1.fontSize = 96
        gameOver1.zPosition = 150 //make sure that the HUD is not under other nodes
        gameOver1.position = CGPoint(x: size.width / 2, y: size.height / 2)
        
        Win1.text = String(Win2)
        Win1.fontColor = SKColor.yellow
        Win1.fontSize = 96
        Win1.zPosition = 150 //make sure that the HUD is not under other nodes
        Win1.position = CGPoint(x: size.width / 2, y: size.height / 2)
    }
    
    
    // This is a function that runs every tie SpriteKit updates the game frame
    override func update(_ currentTime: TimeInterval) {
        //check for collisions between koala and other objects
        checkCollisions()
        checkCollisions2()
        checkCollisions3()
        checkCollisions4()
    }
    
    //touch commands
    
    //method responds to a single touch
    
    //Func that runs every time spritekit updates the game frame
    
    override func touchesBegan(_ touches:Set<UITouch>, with event: UIEvent?){
        guard let touch = touches.first else{
            return
        }
        let touchLocation = touch.location(in: self)
        
        //make koala move horizontally
        let destination = CGPoint(x: touchLocation.x, y: touchLocation.y)
        
        //create action
        
        let actionMove = SKAction.move(to: destination, duration: 1)
        
        //tell koala to move
        koala.run(actionMove)
    }
    
    func spawnPellet (){
        let pellet = SKSpriteNode(imageNamed: "pellet")
        //randomize horizontal position of the pellet
        let horizontalPosition = CGFloat(arc4random_uniform(UInt32(size.width - 300 ))) + 100
        
        let verticalPosition = CGFloat(arc4random_uniform(UInt32(size.height - 300))) + 100
        
        //randomize veritcal position of the pellet
        let startingPosition = CGPoint(x: horizontalPosition, y: verticalPosition)
        pellet.position = startingPosition
        pellet.size = CGSize(width: 50, height: 50)
        pellet.name = "pellet"
        addChild(pellet)
    }
    func spawnMonster(){
        let monster = SKSpriteNode(imageNamed: "monster")
        //monster.setScale(1.0)
        monster.size = CGSize (width:100, height: 100)
        let startingPosition = CGPoint(x: size.width / 2, y: size.height / 2)
        
        monster.position = startingPosition
        //give the monster a name
        monster.name = "monster"
        addChild(monster)
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
        //loop over all the obstacles colliding with koala
        for monster in hitMonsters {
            koalaHit(by: monster)
        }
    }
    // this functions removes monster from game
    func koalaHit(by monster: SKSpriteNode) {
        let pellet = SKSpriteNode (imageNamed: "pellet")
        
        // remove monster from scene
        koala.removeFromParent()
        
        addChild(gameOver1)
        pellet.removeFromParent()
    }
    
    func checkCollisions2() {
        let monster = SKSpriteNode (imageNamed: "monster")
        //check if pellet collides with koala
        enumerateChildNodes(withName: "pellet", using: {
            node, _ in
            
            let pellet = node as! SKSpriteNode
            
            // Check to see if the koala is intersecting with koala
            if pellet.frame.intersects(self.koala.frame) {
                self.score += 1
                self.scoreLabel.text = String(self.score)
                // This monster intersects with koala
                pellet.removeFromParent()
                pellet.physicsBody = nil
                pellet.removeAllActions()
                self.spawnPellet()
                
                if self.score == 35 {
                    self.addChild(self.Win1)
                    self.koala.removeFromParent()
                    pellet.removeFromParent()
                    monster.removeFromParent()
                }
                
            }
        })
    }
    
    func checkCollisions3() {
        // Code to find if monster collides with frame
        enumerateChildNodes(withName: "monster", using: {
            node, _ in
            // get a reference to current node that was found with name "monster"
            let monster = node as! SKSpriteNode
            
            // Check to see if the monster is intersecting with frame
            let horizontalPosition = CGFloat(arc4random_uniform(UInt32(self.size.width)))
            let verticalPosition = CGFloat(arc4random_uniform(UInt32(self.size.height)))
            let endingPosition = CGPoint(x: horizontalPosition, y: verticalPosition)
            let actionMove = SKAction.move(to: endingPosition, duration: 1)
            
            monster.run(actionMove)
            
            if self.frame.intersects(monster.frame) {
                
                let horizontalPosition = CGFloat(arc4random_uniform(UInt32(self.size.width)))
                let verticalPosition = CGFloat(arc4random_uniform(UInt32(self.size.height)))
                let endingPosition = CGPoint(x: horizontalPosition, y: verticalPosition)
                let actionMove = SKAction.move(to: endingPosition, duration: 1)
                
                monster.run(actionMove)
            }
        })
    }
    
    func checkCollisions4() {
        // Code to check if  pellet hits frame
        enumerateChildNodes(withName: "pellet", using: {
            node, _ in
            // get a reference to current node that was found with name "monster"
            let pellet = node as! SKSpriteNode
            
            if pellet.frame.intersects(self.border.frame) {
                print("pellet hit the border")
                pellet.removeFromParent()
                pellet.physicsBody = nil
                pellet.removeAllActions()
                self.spawnPellet()
            }
        })
    }
    
}

