//
//  PlacesAPI.swift
//  Sapin
//
//  Created by Nathan Stooss on 05/04/2021.
//  Copyright © 2021 Jael Beining. All rights reserved.
//

import Foundation

struct PlaceFeatures:Decodable {
    var features: FeatureProperty
}

struct FeatureProperty:Decodable {
    var properties: [PlaceProperty]
}

struct PlaceProperty:Decodable {
    var name:String
    var street:String
    var distance:Int
}
