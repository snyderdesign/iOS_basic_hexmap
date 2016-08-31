//
//  RandomTerrainGenerator.swift
//  HexNav
//
//  Created by Robert Snyder on 7/25/16.
//  Copyright (c) 2016 Robert Snyder. All rights reserved.
//

import Foundation

class RandomTerrainGenerator: TerrainGenerator {
    func generate(coordinate: Coordinate) -> Int {
        let rando = Int(arc4random_uniform(100))
		if rando > 90 {
			return 1
		} else {
			return 0
		}
    }
}