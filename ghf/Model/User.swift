//
//  User.swift
//  ghf
//
//  Created by toscano on 2/19/21.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    var publicRepos: Int
    var publicGists: Int
    var htmlUrl: String
    var following: Int
    var folowers: Int
    var createdAt: String
    
}
