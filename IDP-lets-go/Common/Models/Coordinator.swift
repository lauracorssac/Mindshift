//
//  Coordinator.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

enum Screen {
    case overview, name, gender, birthdate, profession, education,
         meditationStart, meditation, meditationEnd
    
    func nextScreen() -> Screen? {
        
        switch self {
            
        case .overview:
                .name
        case .name:
                .gender
        case .gender:
                .birthdate
        case .birthdate:
                .profession
        case .profession:
                .education
        case .education:
                .meditationStart
        case .meditationStart:
                .meditation
        case .meditation:
                .meditationEnd
        case .meditationEnd:
            nil
        }
        
    }
}

class AppCoordinator: ObservableObject {
    @Published var path = NavigationPath()
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    func pushNext(to screen: Screen) {
        if let next = screen.nextScreen() {
            self.push(next)
        }
    }
    
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
            
        case .overview:
            OverviewPageView()
            
        case .name:
            NameQuestionView()
            
        case .gender:
            GenderQuestionView()
            
        case .birthdate:
            BirthdateQuestionView()
            
        case .education:
            EducationQuestionView()
        
        case .profession:
            ProfessionQuestionView()
            
        case .meditationStart:
            MeditationStartView()
            
        case .meditation:
            MeditationAudioView()
        
        case .meditationEnd:
            MeditationEndView()
        }
    }
}
