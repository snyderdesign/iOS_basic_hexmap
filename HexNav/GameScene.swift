//
//  GameScene.swift
//  HexNav
//
//  Created by Robert Snyder on 7/25/16.
//  Copyright (c) 2016 Robert Snyder. All rights reserved.
//

import SpriteKit


class GameScene: SKScene {
	var tileHeight: CGFloat = 30
	var xOffset: CGFloat = 0
	var yOffset: CGFloat = 0
	var midPoint: CGPoint?
//	let mapDefinition: Coordinate = Coordinate(x: 0, y: -2220)
	
	// let map = Map(radius: 100, terrainGenerator: MarkovTerrainGenerator(map: map))
	
	let map = Map(radius: 10, terrainGenerator: RandomTerrainGenerator())
//	let map = Map(radius: 5, terrainGenerator: PerlinNoiseTerrainGenerator(height: 10, width: 10, octaves: 5))
	//PerlinNoiseTerrainGenerator(height: 40, width: 40, octaves: 5)
	override func didMoveToView(view: SKView) {
		tileHeight = CGRectGetMidY(self.frame)*(0.185)
		print("LoadedScene")
		self.backgroundColor = UIColor.cyanColor()
		midPoint = CGPoint(x:(CGRectGetMidX(self.frame)-200), y:(CGRectGetMidY(self.frame)-260))
		
		refresh(tileHeight, midPoint: midPoint!)
		
	}
	//override func
	func refresh(titleHeight: CGFloat, midPoint: CGPoint) {
		self.map.camera(midPoint, height: titleHeight)
		for (_, tile) in map.tiles {
			self.addChild(tile)
		}
	}
	
//	override func keyDown(theEvent: NSEvent) {
//		switch(theEvent.keyCode) {
//		case 126: // Up
//			yOffset -= tileHeight
//			print("Up \(yOffset)")
//		case 124: // Right
//			xOffset -= tileHeight
//			print("Right \(xOffset)")
//		case 125: // Down
//			yOffset += tileHeight
//			print("Down \(yOffset)")
//		case 123: // Left
//			xOffset += tileHeight
//			print("Left \(xOffset)")
//		case 24: // Plus
//			tileHeight += 2.0
//			print("Zoom In \(tileHeight)")
//		case 27: // Minus
//			tileHeight -= 2.0
//			print("Zoom Out \(tileHeight)")
//		default:
//			true
//		}
//		let midPoint = CGPoint(x:(CGRectGetMidX(self.frame)+xOffset), y:(CGRectGetMidY(self.frame)+yOffset))
//		self.map.camera(midPoint, height: tileHeight)
//	}
	
	override func update(currentTime: CFTimeInterval) {
		/* Called before each frame is rendered */
		
	}
	
	var touchOne: Tile?
	var touchTwo: Tile?
	//makes source red
//	if source.type == 0 {
//	print("Source")
//	source.type = 3
//	source.texture = SKTexture(imageNamed: "grassRed")
//	} else if source.type == 1 {
//	print("Source")
//	source.type = 5
//	source.texture = SKTexture(imageNamed: "rockRed")
//	}
//	
//	// makes destination red
//	print(finalDest.type)
//	if finalDest.type == 0 {
//	print("Destination")
//	finalDest.type = 3
//	finalDest.texture = SKTexture(imageNamed: "grassRed")
//	} else if finalDest.type == 1 {
//	print("Destination")
//	finalDest.type = 5
//	finalDest.texture = SKTexture(imageNamed: "rockRed")
//	}
	
	func setupTouch(touch: Tile) {
		if touchOne == nil {
			touchOne = touch
			print("touchONE")
			if touchOne!.type == 0 {
				print("Source")
				touchOne!.type = 3
				touchOne!.texture = SKTexture(imageNamed: "grassRed")
			} else if touchOne!.type == 1 {
				print("Source")
				touchOne!.type = 5
				touchOne!.texture = SKTexture(imageNamed: "rockRed")
			}
		} else if touchTwo == nil {
			touchTwo = touch
			print("touchTwo")
			if touchTwo!.type == 0 {
				print("Destination")
				touchTwo!.type = 3
				touchTwo!.texture = SKTexture(imageNamed: "grassRed")
			} else if touchTwo!.type == 1 {
				print("Destination")
				touchTwo!.type = 5
				touchTwo!.texture = SKTexture(imageNamed: "rockRed")
			}
			let path = map.processDijkstra(touchOne!, finalDest: touchTwo!, movementPoints: 4)
			print("touchTwo")
			print(path?.total)
//			refresh(tileHeight, midPoint: midPoint!)
//			let middlePoint = CGPoint(x:(CGRectGetMidX(self.frame)-200), y:(CGRectGetMidY(self.frame)-260))
//			refresh(tileHeight, midPoint: middlePoint)
		} else if touchOne != nil && touchTwo != nil {
			print("reset")
			touchOne!.texture = SKTexture(imageNamed: touchOne!.name!)
			touchOne = nil
			touchTwo!.texture = SKTexture(imageNamed: touchTwo!.name!)
			touchTwo = nil
			
		}
	}
	
	override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
		
		
		// 1 - Choose one of the touches to work with
		guard let touch = touches.first else {
			return
		}
		let touchLocation = touch.locationInNode(self)
		let node = self.nodeAtPoint(touchLocation)
		let tile = node as! Tile
		setupTouch(tile)
//		
//		print(touchLocation)
//		//let originTile = Tile(coder: self.nodeAtPoint(CGPoint(x: 0, y: 0)))
//
//		print(tile.coordinate)
//		print(node.position)
//		var path = map.processDijkstra(tile, destination: tile, movementPoints: 3)
		
//		if let name = node.name {
//			if node =
//			var addedScore = 0
//			switch name {
//				
//			// Circles
//			case Shape.RedCircle.name: addedScore = Shape.RedCircle.score
//			case Shape.BlueCircle.name: addedScore = Shape.BlueCircle.score
//			case Shape.YellowCircle.name: addedScore = Shape.YellowCircle.score
//			case Shape.GreenCircle.name: addedScore = Shape.GreenCircle.score
//			case Shape.PurpleCircle.name: addedScore = Shape.PurpleCircle.score
//			case Shape.BlackCircle.name: addedScore = Shape.BlackCircle.score
//			case Shape.Satellite.name: addedScore = Shape.Satellite.score
//				
//			default: addedScore = 0
//			}
//			playerScore = playerScore + addedScore
//			playerScoreUpdate()
//			explosion()
//			
//		} else {
//			
//			playerlife--
//			
//			if playerlife == 2 {
//				playerLifeImage3.hidden = true
//			} else if playerlife == 1 {
//				playerLifeImage3.hidden = true
//				playerLifeImage2.hidden = true
//			} else if playerlife == 0 {
//				playerLifeImage3.hidden = true
//				playerLifeImage2.hidden = true
//				playerLifeImage1.hidden = true
//			} else {
//				playerLifeImage3.hidden = false
//				playerLifeImage2.hidden = false
//				playerLifeImage1.hidden = false
//			}
//		}
		
		
//		for tile in map.tiles {
//			if touchLocation.x
//			print (tile.0.)
//		}
		
//		// 2 - Set up initial location of projectile
//		let projectile = SKSpriteNode(imageNamed: "projectile")
//		projectile.position = player.position
		
//		// 3 - Determine offset of location to projectile
//		let offset = touchLocation - projectile.position
//		projectile.physicsBody = SKPhysicsBody(circleOfRadius: projectile.size.width/2)
//		projectile.physicsBody?.dynamic = true
//		projectile.physicsBody?.categoryBitMask = PhysicsCategory.Projectile
//		projectile.physicsBody?.contactTestBitMask = PhysicsCategory.Monster
//		projectile.physicsBody?.collisionBitMask = PhysicsCategory.None
//		projectile.physicsBody?.usesPreciseCollisionDetection = true
		
//		// 4 - Bail out if you are shooting down or backwards
//		if (offset.x < 0) { return }
//		
//		// 5 - OK to add now - you've double checked position
//		addChild(projectile)
		
//		// 6 - Get the direction of where to shoot
//		let direction = offset.normalized()
		
//		// 7 - Make it shoot far enough to be guaranteed off screen
//		let shootAmount = direction * 1000
		
//		// 8 - Add the shoot amount to the current position
//		let realDest = shootAmount + projectile.position
		
//		// 9 - Create the actions
//		let actionMove = SKAction.moveTo(realDest, duration: 2.0)
//		let actionMoveDone = SKAction.removeFromParent()
//		projectile.runAction(SKAction.sequence([actionMove, actionMoveDone]))
//		projectile.runAction(SKAction.playSoundFileNamed("pew-pew.mp3", waitForCompletion: false))
	}
	
}




//import SpriteKit
//
//class GameScene: SKScene {
//    override func didMoveToView(view: SKView) {
//        /* Setup your scene here */
//        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
//        myLabel.text = "Hello, World!"
//        myLabel.fontSize = 45
//        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
//        
//        self.addChild(myLabel)
//    }
//    
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//       /* Called when a touch begins */
//        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//            
//            let sprite = SKSpriteNode(imageNamed:"Spaceship")
//            
//            sprite.xScale = 0.5
//            sprite.yScale = 0.5
//            sprite.position = location
//            
//            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
//            
//            sprite.runAction(SKAction.repeatActionForever(action))
//            
//            self.addChild(sprite)
//        }
//    }
//   
//    override func update(currentTime: CFTimeInterval) {
//        /* Called before each frame is rendered */
//    }
//}
