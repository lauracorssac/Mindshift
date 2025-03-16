//
//  ConsentView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 26.12.24.
//

import SwiftUI

struct JustifiedText: UIViewRepresentable {
    var text: String
    var font: UIFont = UIFont.systemFont(ofSize: 18)
    
    func makeUIView(context: Context) -> UITextView {
        let label = UITextView()
        label.text = text
        label.textAlignment = .justified
        label.font = font
        label.isEditable = false
        return label
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}

struct ConsentView: View {
    
    @EnvironmentObject private var coordinator: AppCoordinator
    let consentText: String
    
    var body: some View {
        
        VStack {
            Image("consentIcon")
                .padding(.top, 60)
            Text("Consent Statement")
                .font(.system26Bold)
            
            GeometryReader { proxy in
                ScrollView {
                    JustifiedText(text: consentText)
                        .frame(minHeight: proxy.size.height)
                        .padding(.horizontal, 16)
                }
                .scrollIndicators(.visible)
            }
            
            Button("I consent") {
                coordinator.pushNext(to: .consent)
            }
            
        }
        .buttonStyle(RoundedButtonStyle())
    }
}

#Preview {
    ConsentView(consentText: MockConsent().text)
}
