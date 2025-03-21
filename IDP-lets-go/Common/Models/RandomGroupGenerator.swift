//
//  RandomABTesting.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 03.03.25.
//

import Foundation

enum Group: String, Encodable, CaseIterable {
    case control, target
}

protocol GroupGenerator {
    func getGroupGenerator() -> Group
}

class RandomGroupGenerator: GroupGenerator {
    func getGroupGenerator() -> Group {
        let options = Group.allCases
        return options.randomElement() ?? .control
    }

}

//class FirebaseGroupGenerator: GroupGenerator {
//    
//    func fetchFromFireBase() async -> Group {
//        return await withCheckedContinuation { continuation in
//            RemoteConfig.remoteConfig().fetch { status, error in
//                if status == .success {
//                    let group = RemoteConfig.remoteConfig().configValue(forKey: "group_name").boolValue
//                    continuation.resume(returning: group ? .control : .target)
//                } else {
//                    print("Error fetching Remote Config: \(error?.localizedDescription ?? "Unknown error")")
//                    continuation.resume(returning: .target)
//                }
//            }
//        }
//    }
//    
//    func getGroupGenerator() async -> Group {
//        return await fetchFromFireBase()
//    }
//}
