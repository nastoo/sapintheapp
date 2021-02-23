//
//  Model.swift
//  Sapin
//
//  Created by Jael Beining on 23/02/2021.
//  Copyright © 2021 Jael Beining. All rights reserved.
//

import Foundation

//class CoordinateAlone:Decodable {
//    var latitude:Double
//    var longitude:Double
//}
//class CoordinatesArray:Decodable {
//    var coordinateAlone: CoordinateAlone
//}
//class AllCoordinates:Decodable {
//    var coordinateArray:CoordinatesArray
//}
//class Geometry:Decodable {
//    var coordinates:[[[String:Double]]]
//}
//class Numero:Decodable{
//    
//}
class Propriety:Decodable{
//    var numero:String
}
class Feature:Decodable{
//    var geometry:Geometry
    var properties:Propriety
}
class ArretsContainer:Decodable{
    var type:String!
    var features:[Feature]
}
