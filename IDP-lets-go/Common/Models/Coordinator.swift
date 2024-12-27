//
//  Coordinator.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

enum Screen {
    case name, gender, birthdate, profession, education, 
         meditationStart, clouds, meditation, meditationEnd
    
    func nextScreen() -> Screen? {
        
        switch self {
            
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
                .clouds
        case .clouds:
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
            
        case .clouds:
            MeditationCloudsView()
            
        case .meditation:
            MeditationAudioView()
        
        case .meditationEnd:
            MeditationEndView()
        }
    }
}
