//
//  PlacesRequest.swift
//  Sapin
//
//  Created by Nathan Stooss on 05/04/2021.
//  Copyright © 2021 Jael Beining. All rights reserved.
//

import Foundation

enum PlaceError:Error {
    case noDataAvailable
    case cannotProcessData
}

struct PlacesRequest {
    let resourceURL:URL
    let API_KEY = "1437be8c44fc48a1b225db9cc6044139"
    
    init(longitude:Double, latitude:Double) {
        let ressourceString = "https://api.geoapify.com/v2/places?categories=catering.restaurant,catering.pub,entertainment.cinema&filter=circle:\(longitude),\(latitude),1000&bias=proximity:\(longitude),\(latitude)&limit=20&apiKey=\(API_KEY)"
        guard let resourceURL = URL(string: ressourceString) else {fatalError()}
        
        self.resourceURL = resourceURL
    }
    
    func getPlaces(completion: @escaping(Result<[PlaceProperty], PlaceError>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resourceURL) { data, _, _ in
            guard let jsonData = data else {
                completion(.failure(.noDataAvailable))
                return
            }
            do {
                let decoder = JSONDecoder()
                let placesResponse = try decoder.decode(PlacesResponse.self, from: jsonData)
            }
        }
        dataTask.resume()
    }
}
