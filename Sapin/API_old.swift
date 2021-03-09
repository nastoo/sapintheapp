////
////  API.swift
////  Sapin
////
////  Created by Jael Beining on 23/02/2021.
////  Copyright © 2021 Jael Beining. All rights reserved.
////
//
//import Foundation
//
//class API_old{
//    func getArretCoord(){
//        let url = URL(string: "https://data.mobilites-m.fr/api/lines/json?types=ligne&codes=SEM_C")
//        
//        let session = URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            do {
//                if let dataResult = data {
//                    print(data)
//                    do {
//                        let jsonDecoder = JSONDecoder()
//                        let stationsResult = try jsonDecoder.decode(ArretsContainer.self, from: dataResult)
////                        completion(stationsResult)
//                        print(stationsResult)
//                    }
//                    catch {
//                        print("Error")
//                    }
//                }
//                else {
//                    print("No result")
//                }
//            }
//            catch {
//                print(error.localizedDescription)
//            }
//        }
//        
//
//        session.resume()
//        
//        
//        
////        let resultTemp:[[Double]]
////        resultTemp = [[5.69048,45.16639],[5.69039,45.16673]]
//        
//    }
//}
