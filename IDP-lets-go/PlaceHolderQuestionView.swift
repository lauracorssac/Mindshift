//
//  PlaceHolderQuestionView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 03.03.25.
//

import SwiftUI

struct PlaceHolderQuestionView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    
    var body: some View {
        VStack {
            Text("QUESTIOOONNNN")
            Button(action: {
                coordinator.pushNext(to: .question)
            }, label: {
                Text("Button")
            })
        }
    }
}

#Preview {
    PlaceHolderQuestionView()
}
