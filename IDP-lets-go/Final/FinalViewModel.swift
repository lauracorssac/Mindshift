//
//  FinalViewModel.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 29.03.25.
//

import Foundation
import Firebase
import FirebaseFirestore

protocol FinalViewModel {
    var isLoading: Bool { get }
}

class MockFinalViewModel: FinalViewModel {
    var isLoading = true
}

@Observable
class FinalViewModelImpl: FinalViewModel {
    
    @MainActor var isLoading = true
    
    init() {
        
        addUser(completion: handleResult)
    }
    
    func handleResult(result: Result) {
        Task { @MainActor in
            isLoading = false
        }
    }

    func addUser(completion: @escaping (Result) -> ()) {
        
        if (Constants.DEBUG) {
            print(UserModel.shared.user.answers)
            completion(.success)
            return
        }
        
        let db = Firestore.firestore()
        
        guard
            let jsonData = try? JSONEncoder().encode(UserModel.shared.user),
            let jsonDict = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any]
        else {
            completion(.error)
            return
        }

        db.collection("users")
            .document(UserModel.shared.user.id.uuidString)
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
