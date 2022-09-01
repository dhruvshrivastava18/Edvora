//
//  ApicallerProducts.swift
//  Edvora
//
//  Created by Dhruv Shrivastava on 01/09/22.
//

import Foundation
// API caller implemented for products
class ApiCallerProducts {
    
    static let shared = ApiCallerProducts()
    
    private init() {}
    
    func downloadJSON(completed: @escaping ([Products]) -> ()) {
        guard let url = URL(string: "https://assessment.api.vweb.app/products") else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            do {
                let products = try JSONDecoder().decode([Products].self, from: data)
                
                completed(products)
                
            } catch let error {
                print(error)
            }
        }
        .resume()
    }
}
