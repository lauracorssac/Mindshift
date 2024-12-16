//
//  Coordinator.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 16.12.24.
//

import SwiftUI

enum Screen {
    case name, gender, birthdate, profession, education
}

protocol Coordinator: ObservableObject {
    var path: NavigationPath { get set }
}

class MockCoordinator: Coordinator {
    var path = NavigationPath()
}

class AppCoordinator: Coordinator {
    @Published var path = NavigationPath()
    
    func push(_ screen: Screen) {
        path.append(screen)
    }
    
    @ViewBuilder
    func build(_ screen: Screen) -> some View {
        switch screen {
         
        default:
            NameQuestionView<AppCoordinator>()
            
        }
    }
}
