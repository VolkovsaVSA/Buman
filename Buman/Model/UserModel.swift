//
//  UserModel.swift
//  Buman
//
//  Created by Sergey Volkov on 19.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation

struct UserModel {
    let id: String
    var email: String
    var firstName: String
    var lastName: String
    var friends: [String]
    var teamMember: [String]
    var teamOwner: [String]
    var userImage: Data
}
