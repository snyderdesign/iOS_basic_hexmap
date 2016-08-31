//
//  Coordinate.swift
//  HexNav
//
//  Created by Robert Snyder on 7/25/16.
//  Copyright (c) 2016 Robert Snyder. All rights reserved.
//

import Foundation

class Coordinate {
    let x: Int
    let y: Int
  
    var hashValue: Int {
        return x ^ y
    }

    func z() -> Int {
        return -(x+y)
    };

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    init(x: Int, z: Int) {
        self.x = x
        self.y = -(x+z)
    }

    init(y: Int, z: Int) {
        self.y = y
        self.x = -(y+z)
    }

    
    func col() -> Int {
        return (x+(z()-(z()%2))/2)
    }
    
    func row() -> Int {
        return z()
    }

    func neighbors() -> [Coordinate] {
        let checks = [
            Coordinate(x: self.x, y: self.y-1),
            Coordinate(x: self.x-1, y: self.y),
            Coordinate(x: self.x, y: self.y+1),
            Coordinate(x: self.x+1, y: self.y-1),
            Coordinate(x: self.x+1, y: self.y),
            Coordinate(x: self.x+1, y: self.y+1)
        ]
		return checks
		
//		-1,0
//		0, -1
//		+1,0
//		-1,+1
//		0,+1
//		+1,+1
    }
}

extension Coordinate: Hashable {}

func ==(lhs: Coordinate, rhs: Coordinate) -> Bool {
    return lhs.x == rhs.x && lhs.y == rhs.y
}
