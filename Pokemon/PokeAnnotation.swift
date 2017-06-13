//
//  PokeAnnotation.swift
//  Pokemon
//
//  Created by the Luckiest on 6/13/17.
//  Copyright © 2017 the Luckiest. All rights reserved.
//


import UIKit
import MapKit

class PokeAnnotation:NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var pokemon: Pokemon
    
    init(coord: CLLocationCoordinate2D, pokemon: Pokemon) {
        self.coordinate = coord
        self.pokemon = pokemon
    }
}
