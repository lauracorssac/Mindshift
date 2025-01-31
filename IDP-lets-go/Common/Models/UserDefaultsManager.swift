//
//  UserDefaultsManager.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 24.01.25.
//

import Foundation

class UserDefaultsManager {
    static let shared = UserDefaultsManager()
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    
    func setValue<T>(key: String, value: T) {
        defaults.set(value, forKey: key)
    }
    
    func getValue<T>(key: String, defaultValue: T) -> T {
        return defaults.object(forKey: key) as? T ?? defaultValue
    }
}
