//
//  RepresentativeController.swift
//  Representative
//
//  Created by Blake kvarfordt on 8/14/19.
//  Copyright © 2019 Blake kvarfordt. All rights reserved.
//

import Foundation

class RepresentativeController {
    
    static func searchRepresentatives(forState state: String, completion: @escaping ([Representative]) -> Void) {
        
        // defining the end components of the url we need
        let dictionary = ["state" : state.lowercased(), "output" : "json"]
        
        // specifying the exact parameters that we are using
        let queryItems = [URLQueryItem(name: "state", value: dictionary["state"]), URLQueryItem(name: "output", value: dictionary["output"])]
        
        // defining the components in the url we are using
        var components = URLComponents(string: "http://whoismyrepresentative.com/getall_reps_bystate.php")
        
        // setting the queryItems we created for the components url
        components?.queryItems = queryItems
        
        // 
        guard let finalURL = components?.url else { completion([]); return }
        
        
        let request = URLRequest(url: finalURL)
        
        
        URLSession.shared.dataTask(with: request) { (data, _, error) in
            
            if let error = error {
                completion([])
                print(error)
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else {
                print("error trying to get the data")
                completion([])
                return
            }
            
            guard let badSpelling = String(data: data, encoding: .ascii) else { completion([]); return }
            guard let goodSpelling = badSpelling.data(using: .utf8) else { completion([]); return }
            
            do {
                let decoder = JSONDecoder()
                let representatives = try decoder.decode([String: [Representative]].self, from: goodSpelling)
                guard let repArray = representatives["results"] else { completion([]); return }
                print(repArray)
                completion(repArray)
                return
            } catch {
                print(error)
                print(error.localizedDescription)
            }
        } .resume()
    }
}
