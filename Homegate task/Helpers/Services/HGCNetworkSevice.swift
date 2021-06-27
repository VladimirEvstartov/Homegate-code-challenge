//
//  HGCNetworkSevice.swift
//  Homegate task
//
//  Created by Vladimir on 25.06.2021.
//

import Foundation


protocol HGCNetworkServicePtorocol {
    func loadProperties(completion: @escaping (Result<[HGCPrpoperty], Error>) -> ())
}
 
extension HGCNetworkServicePtorocol {
    
    func loadProperties(completion: @escaping (Result<[HGCPrpoperty], Error>) -> ()){
        URLSession.shared.dataTask(with: .properties()) { data, response, error in
            DispatchQueue.main.async {
                completion(self.parse(data: data, error: error))
            }
        }.resume()
    }

    
    func parse(data: Data?, error: Error?) -> (Result<[HGCPrpoperty], Error>){
        if let data = data {
            return Result { try JSONDecoder().decode(HGCPrpopertyResponce.self, from: data).items ?? []}
        } else {
            return .failure(error ?? URLError(.badServerResponse))
        }
    
    }
}

struct HGCNetworkService: HGCNetworkServicePtorocol {

}

extension URLRequest {
    static func properties() -> URLRequest {
        return URLRequest(url: URL(string: "http://private-492e5-homegate1.apiary-mock.com/properties")!)

    }
}

