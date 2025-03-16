//
//  DemographicsViewModel.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 09.02.25.
//

import Foundation

class DemographicsViewModel: ObservableObject {
    
    @Published var shouldPresentNextView = false
    @Published var shouldPresentError = false
    @Published var isLoading = false
    
    @Published var birthYear = ""
    @Published var education = ""
    @Published var profession = ""
    @Published var gender = ""
    @Published var race = ""
    
    let questions: [DemographicQuestion] = [
        .gender, .birthdate, .race, .educationBackground, .profession
    ]
    
    
    func isButtonDisabled(for currentStep: Int) -> Bool {
        
        let step = questions[currentStep]
        
        switch step {
            
        case .race:
            return race.isEmpty
        case .birthdate:
            return birthYear.isEmpty
        case .gender:
            return gender.isEmpty
        case .educationBackground:
            return education.isEmpty
        case .mmock:
            return true
        case .profession:
            return profession.isEmpty
        }
        
    }
    
    func saveData() {
        Task { @MainActor in
            isLoading = true
            let user = User(
                id: UUID(),
                gender: gender,
                birthYear: birthYear,
                race: race,
                education: education,
                profession: profession
            )
            let result = await Requests.shared.saveUser(user: user)
            switch result {
            case .success:
                shouldPresentNextView = true
                isLoading = false
            case .error:
                isLoading = false
                shouldPresentError = true
            }
        }
    }
    
}
