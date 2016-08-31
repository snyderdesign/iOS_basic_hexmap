//
//  TerrainGenerator.swift
//  HexNav
//
//  Created by Robert Snyder on 7/25/16.
//  Copyright (c) 2016 Robert Snyder. All rights reserved.
//

import Foundation

protocol TerrainGenerator {
    func generate(coordinate: Coordinate) -> Int
}