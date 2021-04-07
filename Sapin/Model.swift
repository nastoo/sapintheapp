//
//  Model.swift
//  Sapin
//
//  Created by Jael Beining on 23/02/2021.
//  Copyright © 2021 Jael Beining. All rights reserved.
//

import Foundation
import MapKit

// 3eme API (geoapify)
public class PlaceContainer:Decodable {
    var features: [PlacesProperties]!
}

public class PlacesProperties:Decodable {
    var properties: PlacesDetails!
}

public class PlacesDetails:Decodable {
    var name:String!
    var housenumber:String!
    var street:String!
    var city:String!
    var distance:Int

}


//2nd api
public class ArretContainer:Decodable {
    var features: [Feature_2]!
}

public class Feature_2: Decodable{
    var properties: Properties_2!
    var geometry: Geometry_2!
}

public class Geometry_2: Decodable {
    var coordinates: [Double]!
}

public class Properties_2:Decodable{
    var CODE: String!
    var arr_visible: String!
}


//1ere api
public class TagContainer: Decodable {
    var features: [Feature]!
}

public class Feature: Decodable {
    var geometry: Geometry!
    var properties: Property!
}

public class Property: Decodable {
    var ZONES_ARRET: [String]!
}

public class Geometry: Decodable {
    var coordinates: [CLLocationCoordinate2D]!
    
    enum CodingKeys: String, CodingKey {
        case coordinates
    }
    
    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let tmpCoordinates = try values.decode([[[Double]]].self, forKey: .coordinates)
        
        let allCoordinates = tmpCoordinates.first
        
        coordinates = [CLLocationCoordinate2D]()
        allCoordinates?.forEach({ (coord) in
            coordinates.append(CLLocationCoordinate2D(latitude: coord[1], longitude: coord[0]))
        })
    }
}

