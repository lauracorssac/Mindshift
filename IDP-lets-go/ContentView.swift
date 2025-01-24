//
//  ContentView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 01.12.24.
//

import SwiftUI

struct ContentView: View {
   
    @StateObject var coordinator = AppCoordinator(model: Constants.model)
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            coordinator.build(.welcome)
                .navigationDestination(for: Screen.self) { screen in
                    coordinator.build(screen)
                }
        }
        .environmentObject(coordinator)
        .tint(Color.mainBlue)
    }
}

#Preview {
    ContentView()
}
