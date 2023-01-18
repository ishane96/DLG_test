//
//  SearchVM.swift
//  DLG_Test
//
//  Created by Achintha kahawalage on 2023-01-17.
//

import Foundation

class SearchVM {
    
    var vehicle: Vehicle?
    var urlSession: URLSession
    
    init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    func getVehicleDetails(registration: String, completion: @escaping CompletionHandler) {
        
        var urlComponents = URLComponents(string: Constants.baseURL)!
        urlComponents.queryItems = [
            URLQueryItem(name: "registration", value: registration),
        ]
        
        let newURL = urlComponents.url!
        
        var request = URLRequest(url: newURL)
        request.setValue(Constants.apiKey, forHTTPHeaderField: "x-api-key")
        
        let task = urlSession.dataTask(with: request) {[weak self] data, response, error in
            guard let self = self else {return}
            guard error == nil else {
                completion(false, error!.localizedDescription)
                return
            }
            do {
                guard let data = data else {
                    return
                }
                let vehicle = try JSONDecoder().decode(Vehicle.self, from: data)
                self.vehicle = vehicle
                completion(true, "")
            } catch {
                completion(false, error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
