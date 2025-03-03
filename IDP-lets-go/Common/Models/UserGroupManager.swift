//
//  UserGroupManager.swift
//  IDP-lets-go
//
//  Created by Laura Corssac on 03.03.25.
//

import Foundation

protocol GroupManager {
    var userGroup: Group { get }
}


class MockGroupManager: GroupManager {
    
    let userGroup: Group
    
    init(group: Group) {
        userGroup = group
    }
    
}

class GroupManagerImpl: GroupManager {
    
    private let defaults = UserDefaultsManager.shared
    private let key = "userGroup"
    private let randomGroupGenerator = RandomGroupGenerator()
    
    let userGroup: Group
    
    init() {
        
        let userGroupRawValue = defaults.getValue(key: key, defaultValue: "")
        
        userGroup = Group(
            rawValue: userGroupRawValue
        ) ?? randomGroupGenerator.getGroupGenerator()
        
        defaults.setValue(key: key, value: userGroup.rawValue)
        
    }
    
}
