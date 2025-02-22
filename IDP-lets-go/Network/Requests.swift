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
    
    func saveUser(user: User) async -> Result {
        
        guard Constants.MOCK_SERVER == false else { return .success }
        
        guard let url = URL(string: "http://127.0.0.1:4001/user") else {
            return .error
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
            
            let (_, response) = try await URLSession.shared.data(for: request)
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
