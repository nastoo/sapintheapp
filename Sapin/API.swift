//
//  Api.swift
//  Demo
//
//  Created by Julie Saby on 23/02/2021.
//  Copyright © 2021 Julie Saby. All rights reserved.
//

import Foundation
import MapKit

class API {
    
    public func getTag(completion: @escaping (TagContainer?) -> Void) {
        let url = URL(string: "https://data.mobilites-m.fr/api/lines/json?types=ligne&codes=SEM_C")
        
        let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if let dataResult = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let stationsResult = try jsonDecoder.decode(TagContainer.self, from: dataResult)
                        completion(stationsResult)
                    }
                    catch {
                        print("Error")
                    }
                }
                else {
                    print("No result")
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        session.resume()
    }
    
    public func getArret(completion: @escaping (ArretContainer?) -> Void){
        
        let url = URL(string: "https://data.mobilites-m.fr/api/bbox/json?types=arret")
        
        let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                if let dataResult = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        let arretResult = try jsonDecoder.decode(ArretContainer.self, from: dataResult)
                        completion(arretResult)
                    }
                    catch {
                        print("Error")
                    }
                }
                else {
                    print("No result")
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }
        session.resume()
    }
    
    
}
