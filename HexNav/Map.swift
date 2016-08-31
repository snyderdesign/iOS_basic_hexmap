//
//  Map.swift
//  HexNav
//
//  Created by Robert Snyder on 7/26/16.
//  Copyright © 2016 Robert Snyder. All rights reserved.
//

import Foundation

import Foundation
import SpriteKit

class Map {
	let radius: Int
	var tiles = Dictionary<Coordinate, Tile>()
	var offset: CGPoint = CGPoint(x: 0, y: 0)
	var height: CGFloat = 32
	var bricks: Int = 0
	var terrain: Int = 1
	//(radius: 15, terrainGenerator: PerlinNoiseTerrainGenerator(height: 40, width: 40, octaves: 5))
	init(radius: Int, terrainGenerator: TerrainGenerator) {
		self.radius = radius
		//alternate map construction:---------------------------
		for yIndex in 0...radius {
			for xIndex in 0...radius {
				let coordinate = Coordinate(x: xIndex, y: yIndex)
					//here is where I define what type of terrain it is:
				if bricks < 10 {
					terrain = terrainGenerator.generate(coordinate)
					if terrain == 1 {
						addBrick()
					}
				} else {
					terrain = 0
				}
				let tile = Tile(coordinate: coordinate, map: self, type: terrain)
				self.tiles[coordinate] = tile
			}
		}
		//end of alternate map construction---------------------
	}
	
	func addBrick() {
		bricks += 1
	}
	func tile(coordinate: Coordinate) -> Tile? {
		return tiles[coordinate]
	}
	
	//this is a function that returns the neighbors of this cell if called
	func neighbors(coordinate: Coordinate) -> [Tile] {
		var neighbors: [Tile] = []
		for neighbor in coordinate.neighbors() {
			let tile:Tile? = self.tile(neighbor)
			if let tile = tile {
				neighbors.append(tile)
			}
		}
		return neighbors
	}
	
	func camera(offset: CGPoint, height: CGFloat) {
		if(self.height == height && self.offset == offset) {
			
		} else {
			self.offset = offset
			self.height = height
			for (_, tile) in self.tiles {
				tile.camera(offset, height: height)
			}
		}
	}
	//----start of shortest path
	
	//var path = graph.processDijkstra(a, destination: d, movementPoints: 3)
	func processDijkstra(source: Tile, finalDest: Tile, movementPoints: Int) -> Path? {
		
		print("Made it into the path function")
//		//makes source red
//		if source.type == 0 {
//			print("Source")
//			source.type = 3
//			source.texture = SKTexture(imageNamed: "grassRed")
//		} else if source.type == 1 {
//			print("Source")
//			source.type = 5
//			source.texture = SKTexture(imageNamed: "rockRed")
//		}
//		
//		// makes destination red
//		print(finalDest.type)
//		if finalDest.type == 0 {
//			print("Destination")
//			finalDest.type = 3
//			finalDest.texture = SKTexture(imageNamed: "grassRed")
//		} else if finalDest.type == 1 {
//			print("Destination")
//			finalDest.type = 5
//			finalDest.texture = SKTexture(imageNamed: "rockRed")
//		}
		
		var frontier: [Path] = []
		var finalPaths: [Path] = []
		//use source edges to create the frontier
		for e in self.neighbors(source.coordinate) {
			let newPath: Path = Path()
			newPath.destination = e
			newPath.previous = nil
			newPath.total = movementPoints
			print(newPath.total)
			//add the new path to the frontier
			frontier.append(newPath)
		}
		
		//obtain the best path
		var bestPath: Path = Path()
		var breakerVar = 2
		while(breakerVar > 0) {
			for path in frontier {
				//print(path.destination?.coordinate.x)
				if path.destination!.coordinate.x == finalDest.coordinate.x {
					finalPaths.append(path)
					print("Sucess")
					breakerVar -= 1
				} else if path.total <= 1 {
					breakerVar -= 1
				} else {
					for neighborTile in self.neighbors(path.destination!.coordinate) {
						let newPath: Path = Path()
						newPath.destination = neighborTile
						newPath.previous = path
						newPath.total = path.total - 1
						//print(newPath.total)
						frontier.append(newPath)
						
					}
				}
			}
			//support path changes using the greedy approach
			bestPath = Path()

		}
		print(frontier.count)
		print(finalPaths)
		var bestDist = movementPoints
		for path in finalPaths {
			
			if bestDist > path.total {
				bestDist = path.total
			}
		}
		for path2 in finalPaths {
			if bestDist == path2.total {
				bestPath = path2
				print("the best below")
				print(bestPath.total!)
				
			}
		}

		return bestPath
	}///--------end of shortest path
	//-------------------new Experiment with A*---------------
	//-----------------end of experiment----------------------
}
