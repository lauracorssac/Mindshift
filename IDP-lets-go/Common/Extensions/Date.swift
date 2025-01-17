//
//  Date.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 17.01.25.
//

import Foundation

extension Date {
    
    func toString(format: String = "dd/MM/yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
