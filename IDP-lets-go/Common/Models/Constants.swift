//
//  Constants.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 17.12.24.
//

import Foundation


class Constants {
    
    static let initialStatus: UserStatus? = .firstMeditation 
    static let MOCK_SERVER = true
    
    // For debugging: http://127.0.0.1:4001
    static let userURL = "https://ipd-lets-go.azurewebsites.net"
    static let DEBUG = true
    static let model = RandomModel(numberOfQuestionPerStep: 2, numberOfSteps: 2)
    static let groupManager = MockGroupManager(group: .target)
}
