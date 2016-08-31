//
//  Path.swift
//  HexNav
//
//  Created by Robert Snyder on 7/29/16.
//  Copyright © 2016 Robert Snyder. All rights reserved.
//

import Foundation
import UIKit

public class Vertex {
	var key: String?
	var neighbors: Array<Edge>
	init() {
		self.neighbors = Array<Edge>()
	}
}

public class Edge {
	var neighbor: Vertex
	var weight: Int
	init() {
		weight = 0
		self.neighbor = Vertex()
	}
}

class Path {
	var total: Int!
	var destination: Tile?
	var previous: Path!
	
	//object initialization
	//init(){ destination = Tile}
}

//public class SwiftGraph {
//	private var canvas: Array<Vertex>
//	public var isDirected: Bool
//	init() {
//		canvas = Array<Vertex>()
//		isDirected = true
//	}
//	//create a new vertex
//	func addVertex(key: String) -> Vertex {
//		//set the key
//		var childVertex: Vertex = Vertex()
//		childVertex.key = key
//		//add the vertex to the graph canvas
//		canvas.append(childVertex)
//		return childVertex
//	}
//	func addEdge(source: Vertex, neighbor: Vertex, weight: Int) {
//		//create a new edge
//		var newEdge = Edge()
//		//establish the default properties
//		newEdge.neighbor = neighbor
//		newEdge.weight = weight
//		source.neighbors.append(newEdge)
//		//check for undirected graph
//		if (isDirected == false) {
//			//create a new reversed edge
//			var reverseEdge = Edge()
//			//establish the reversed properties
//			reverseEdge.neighbor = source
//			reverseEdge.weight = weight
//			neighbor.neighbors.append(reverseEdge)
//		}
//	}
//}
//
//
