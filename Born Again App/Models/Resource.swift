//
//  Resource.swift
//  Born Again
//
//  Created by Corbin Jensen on 4/16/24.
//

import Foundation

struct Resource: Codable, Identifiable {
  let id: Int
  let user_id: Int
  let title: String
  let description: String
  let category: String
  let created_at: String
  
  let user: User
}
