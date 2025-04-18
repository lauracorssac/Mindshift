//
//  ContentView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 01.12.24.
//

import SwiftUI

struct ContentView: View {
   
    @StateObject var coordinator = AppCoordinator()
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(screen: coordinator.getInitialScreen())
                .navigationDestination(for: Screen.self) { screen in
                    coordinator.build(screen: screen)
                }
        }
        .environmentObject(coordinator)
        .tint(Color.mainBlue)
        .task {
            UserModel.shared.user.group = Constants.groupManager.userGroup
        }
    }
}

#Preview {
    ContentView()
}
