//
//  FinalView.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 29.12.24.
//

import SwiftUI
import Firebase
import FirebaseFirestore

@Observable
class FinalViewModel {
    
    @MainActor var isLoading = false
    
    init() {
        
        addUser(completion: handleResult)
    }
    
    func handleResult(result: Result) {
        Task { @MainActor in
            isLoading = false
        }
    }

    func addUser(completion: @escaping (Result) -> ()) {
        let db = Firestore.firestore()
        
        guard
            let jsonData = try? JSONEncoder().encode(UserModel.user),
            let jsonDict = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
        else {
            completion(.error)
            return
        }

        db.collection("users")
            .document(UserModel.user.id.uuidString)
            .setData(jsonDict) { error in
            if let error = error {
                completion(.error)
                print("Error adding user: \(error)")
            } else {
                completion(.success)
                print("User added successfully!")
            }
        }
    }
    
}


struct FinalView: View {
    
    let viewModel: FinalViewModel

    var body: some View {
        
        if viewModel.isLoading {
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .scaleEffect(2)
                .tint(Color.mainBlue)
            
        } else {
            
            VStack {
                Text("Thank you for your participation!")
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .padding(.horizontal, 25)
                    .padding(.top, 30)
                
                Text("You’ve completed both tests!")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 25)
                    .padding(.top, 10)
                
                Text("Your responses are valuable in improving decision-making.")
                    .font(.body)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 25)
                
                Image(systemName: "party.popper")
                    .font(.system(size: 150))
                    .foregroundColor(Color.mainBlue).padding(.vertical, 40)
                    .padding(.bottom, 30)
            }
        }
    }
}

#Preview {
    FinalView(viewModel: FinalViewModel())
}
