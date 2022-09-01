//
//  ApiCaller.swift
//  Edvora
//
//  Created by Dhruv Shrivastava on 01/09/22.
//

import Foundation
// Api caller implemented for users
class ApiCaller {
    
    static let shared = ApiCaller()
    
    private init() {}
    
    func downloadJSON(completed: @escaping ([Users]) -> ()) {
        guard let url = URL(string: "https://assessment.api.vweb.app/users#") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let users = try JSONDecoder().decode([Users].self, from: data)
                
                completed(users)
                
            } catch let error {
                print(error)
            }
        }
        .resume()
    }
}
