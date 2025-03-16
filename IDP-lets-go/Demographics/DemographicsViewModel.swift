//
//  DemographicsViewModel.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 09.02.25.
//

import Foundation

class DemographicsViewModel: ObservableObject {
    
    @Published var shouldPresentNextView = false
    @Published var birthdate: Birthdate = .init()
    @Published var education = ""
    @Published var professions: Set<String> = []
    @Published var gender = ""
    @Published var races: Set<String> = []
    
    let questions: [DemographicQuestion] = [
        .gender, .birthdate, .race, .educationBackground, .profession
    ]
    
    
    func isButtonDisabled(for currentStep: Int) -> Bool {
        
        let step = questions[currentStep]
        
        switch step {
            
        case .race:
            return races.isEmpty
        case .birthdate:
            return birthdate.isEmpty
        case .gender:
            return gender.isEmpty
        case .educationBackground:
            return education.isEmpty
        case .mmock:
            return true
        case .profession:
            return professions.isEmpty
        }
        
    }
    
    func saveData() {
        
        Task {
            // TODO: build new user based on the published properties
            let result = await Requests.shared.saveUser()
            switch result {
            case .success:
                shouldPresentNextView = true
               
            case .error:
                // TODO: treat
                print("error saving data")
            }
        }
    }
    
}
