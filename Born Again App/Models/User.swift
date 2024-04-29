//
//  User.swift
//  Born Again
//
//  Created by Corbin Jensen on 4/16/24.
//

import Foundation

struct User: Codable, Identifiable {
  let id: Int
  let name: String
  let email: String
  let user_name: String
  let gospel_recieved: Int
}
