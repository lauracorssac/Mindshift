//
//  Requests.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 17.01.25.
//

import Foundation

enum Result {
    case success
    case error
}

class Requests {
    
    static let shared = Requests()
    
    private init() {}
    
    func saveUser() async -> Result {
        
        guard let url = URL(string: "http://127.0.0.1:4001/user") else {
            return .error
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let postData = UserModel.user
            let jsonData = try JSONEncoder().encode(postData)
            request.httpBody = jsonData
            
            let (data, response) = try await URLSession.shared.data(for: request)
            if let response = response as? HTTPURLResponse, response.statusCode == 200 {
                return .success
            } else {
                return .error
            }
           
        } catch {
            return .error
        }

    }
    
    
}
