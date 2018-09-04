//
//  UserInfo.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import Foundation

class UserInfo {
    var fullname: String?
    var email: String?
    var password: String?
    var gender: UserGender?
    var birthdate: Date?
    
    func isBeingFilled() -> Bool {
        return fullname != nil || email != nil || password != nil || gender != nil || birthdate != nil
    }
}

enum UserGender {
    case male
    case female
}
