//
//  APIManager.swift
//  MVVMTask
//
//

import Foundation

class APIService :  NSObject {
    private let sourcesURL = URL(string: "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json")!
    func apiToGetData(completion : @escaping (Concept) -> ()){
        URLSession.shared.dataTask(with: sourcesURL) { (result,_,err)  in
            if let data = result {
                do {
                    let decoder = JSONDecoder()
                    let product = try decoder.decode(Concept.self, from: data)
                    return completion(product)
                } catch let error {
                    print(error)
                }
            }
        }.resume()
    }
}

