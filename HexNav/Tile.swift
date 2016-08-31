//
//  Tile.swift
//  HexNav
//
//  Created by Robert Snyder on 7/25/16.
//  Copyright (c) 2016 Robert Snyder. All rights reserved.
//

import Foundation
import SpriteKit
import UIKit

class Tile : SKSpriteNode {
  var height: CGFloat = 8
  var width: CGFloat { return (height*(sqrt(3.0)/2.0)) }

  let coordinate: Coordinate
  let map: Map
  var type: Int
  
  init(coordinate: Coordinate, map: Map, type: Int) {
    self.coordinate = coordinate
    self.map = map
    self.type = type
	
	//let texture: SKColor = UIColor(CIColor: Tile.spriteName(type))
    let texture: SKTexture = SKTexture(imageNamed: Tile.spriteName(type))
    super.init(texture: texture, color: UIColor(white: 1, alpha: 1), size: CGSize(width: 83, height: 96))//96
	if self.type == 0 {
		self.name = "grass"
	} else if self.type == 1 {
		self.name = "rock"
	} else if self.type == 2 {
		self.name = "grassBlue"
	} else if self.type == 3 {
		self.name = "grassRed"
	} else if self.type == 4 {
		self.name = "rockBlue"
	} else if self.type == 5 {
		self.name = "rockRed"
	}
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

//	func mapLocation() -> CGPoint {
//		let x: CGFloat = width*CGFloat(coordinate.col())+((width/CGFloat(2))*CGFloat(coordinate.row()%2))
//		let y: CGFloat = (height * CGFloat(0.75))*CGFloat(coordinate.row())
//		return CGPoint(x:x,y:y)
//	}
	//alternate below
	func mapLocation() -> CGPoint {
		let x: CGFloat = width*CGFloat(coordinate.x)+((width/CGFloat(2))*CGFloat(coordinate.y%2))
		let y: CGFloat = (height * CGFloat(0.75))*CGFloat(coordinate.y)
		return CGPoint(x:x,y:y)
	}


  func camera(offset: CGPoint, height: CGFloat) {
    self.height = height
    let offsetX: CGFloat = mapLocation().x + (offset.x)*(0.60)
    let offsetY: CGFloat = mapLocation().y + (offset.y)
    self.position = CGPoint(x: offsetX, y: offsetY)
    self.setScale(CGFloat(height)/CGFloat(95))
  }

  static func spriteName(type: Int) -> String {
    switch(type) {
    case 0:
      return "grass"
    case 1:
      return "rock"
    case 2:
      return "grassBlue"
	case 3:
		return "grassRed"
	case 4:
		return "rockBlue"
	case 5:
		return "rockRed"
    default:
      return "sand"
    }
  }

  func neighbors() -> [Tile] {
    var neighbors: [Tile] = []
    for coordinate in self.coordinate.neighbors() {
      let tile:Tile? = map.tile(coordinate)
      if let tile = tile {
        neighbors.append(tile)
      }
    }
    return neighbors
  }
}
