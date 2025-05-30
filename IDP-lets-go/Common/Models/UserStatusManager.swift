//
//  UserStatusManager.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 24.01.25.
//

import Foundation

protocol UserStatusManager {
    var currentStatus: UserStatus { get }
    var hasAlreadyConsent: Bool { get }
    func completeStep(screen: Screen, userGroup: Group)
}



class UserStatusManagerImp: UserStatusManager {
    private let defaults = UserDefaultsManager.shared
    private let key = "userStatus"
    private let initialStep = UserStatus.consent
    
    private(set) var currentStatus: UserStatus
    
    var hasAlreadyConsent: Bool {
        return currentStatus != .consent
    }
    
    init() {
        
        if Constants.shouldPersistData {
            
            if let mockedStatus = Constants.initialStatus {
                currentStatus = mockedStatus
                defaults.setValue(key: key, value: mockedStatus.rawValue)
                print("CURRENT STATUS MOCKED", currentStatus)
            }
            
            let currentStatusString = defaults.getValue(
                key: key,
                defaultValue: initialStep.rawValue
            )
            
            currentStatus = UserStatus(rawValue: currentStatusString) ?? initialStep
        } else {
            currentStatus = initialStep
        }
        
        print("CURRENT STATUS", currentStatus)
    }
    
    
    func completeStep(screen: Screen, userGroup: Group) {
        
        guard
            let updatedStatus = screen.getUpdatedStatus(userGroup: userGroup)
        else {
            return
        }
        
        currentStatus = updatedStatus
        print("NEW CURRENT STATUS", currentStatus)
        defaults.setValue(key: key, value: currentStatus.rawValue)
    }
}
