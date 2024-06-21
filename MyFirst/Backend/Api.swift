//
//  Api.swift
//  MyFirst
//
//  Created by Derrick on 04/04/23.
//

import Foundation

class Api : ObservableObject{
    @Published var cities = [City]()
    @Published var products = [Product]()
    
    func loadProducts(completion:@escaping ([Product]) -> ()) {
        guard let url = "https://api.escuelajs.co/api/v1/products".uri else {
            print("Invalid url...")
            return
        }
        
        sharedUrlSesh.dataTask(with: url) { data, response, error in
            let products = try! decoder.decode([Product].self, from: data!)
//            print("Hi")
//            print(products)
//            print("Bye")
            mainDispatchQueue.async {
                completion(products)
            }
        }.resume()
    }
    
    func loadCities(completion:@escaping ([City]) -> ()) {
        guard let url = ("http://" + (isRealDevice ?
                                                 "192.168.1.4":
                                        "127.0.0.1") + ":8000/cities").uri else {
            print("Invalid url...")
            return
        }
        
        defaultUrlSeshConfig.waitsForConnectivity = true
        defaultUrlSeshConfig.uriSesh.dataTask(with: url) { data, response, error in
            print(response.debugDescription)
            do{
//                print("Hi")
//                print(data as Any)
//                print("Bye")
                let cities = try decoder.decode([City].self, from: data!)
                print(cities)
                mainDispatchQueue.async {
                    completion(cities)
                }
            } catch {
//                print("Hi")
                print(error.localizedDescription)
//                print("Bye")
            }
        }.resume()
    }
}
