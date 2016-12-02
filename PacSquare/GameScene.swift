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
        let destination = CGPoint(x: touchLocation.x, y: koala.position.y)
        
        //create action
        let actionMove = SKAction.move(to: destination, duration: 0.5)
        
        //tell koala to move
        koala.run(actionMove)
        
   
   
    
    
    
    
    //monster lines of code
    //monster lines of code
        //Tells the game whether there will be gravity
        physicsWorld.gravity = CGVector.zero
        //Make this class the physics contact delegate
        
        //add monsters every 5 second
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addMonster),
                SKAction.wait(forDuration: 5)
                ])
        ))
    }
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
        func addMonster() {
            
            // Create sprite
            let monster = SKSpriteNode(imageNamed: "monster")
            
            //Set the physics properties on the monster
            monster.physicsBody = SKPhysicsBody(rectangleOf: monster.size) // 1
            monster.physicsBody?.isDynamic = true // 2
            
            
            // Determine where to spawn the monster along the Y axis
            let actualY = random(min: monster.size.height/2, max: size.height - monster.size.height/2)
            
            // Position the monster slightly off-screen along the right edge,
            // and along a random position along the Y axis as calculated above
            monster.position = CGPoint(x: size.width + monster.size.width/2, y: actualY)
            
            // Add the monster to the scene
            addChild(monster)
            
            // Determine speed of the monster
            let actualDuration = random(min: CGFloat(5.0), max: CGFloat(5.0))
            
            // Create the actions
            let actionMove = SKAction.move(to: CGPoint(x: -monster.size.width/2, y: actualY), duration: TimeInterval(actualDuration))
            let actionMoveDone = SKAction.removeFromParent()
            monster.run(SKAction.sequence([actionMove, actionMoveDone]))
        
    }
}
