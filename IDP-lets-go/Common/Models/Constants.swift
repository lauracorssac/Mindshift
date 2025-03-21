//
//  Constants.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 17.12.24.
//

import Foundation


class Constants {
    
    static let initialStatus: UserStatus? = nil
    static let MOCK_SERVER = true
    
    // For debugging: http://127.0.0.1:4001
    static let userURL = "https://ipd-lets-go.azurewebsites.net"
    static let meditationDebug = false
    static let shouldPersistData = false
    static let model = RandomModel()
    static let groupManager = GroupManagerImpl()
}
