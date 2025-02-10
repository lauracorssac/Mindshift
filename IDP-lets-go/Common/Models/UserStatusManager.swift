//
//  UserStatusManager.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 24.01.25.
//

import Foundation

class UserStatusManager {
    static let shared = UserStatusManager()
    private let defaults = UserDefaultsManager.shared
    private let key = "userStatus"
    private let initialStep = UserStatus.consent
    
    private(set) var currentStatus: UserStatus
    
    var hasAlreadyConsent: Bool {
        return currentStatus != .consent
    }
    
    private init() {
        
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
        
        print("CURRENT STATUS", currentStatus)
    }
    
    func isFirstTest() -> Bool {
        switch currentStatus {
        case .consent, .demographics, .firstTest: return true
        case .firstMeditation, .meditationRepetition, .secondTest, .end: return false
        }
    }
    
    
    func completeStep(screen: Screen) {
        
        guard let updatedStatus = screen.getUpdatedStatus(
            isFirstTest: self.isFirstTest()
        ) else {
            return
        }
        
        currentStatus = updatedStatus
        print("NEW CURRENT STATUS", currentStatus)
        defaults.setValue(key: key, value: currentStatus.rawValue)
    }
}
