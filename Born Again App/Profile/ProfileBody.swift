//
//  ProfileBody.swift
//  Born Again
//
//  Created by Corbin Jensen on 4/12/24.
//

import SwiftUI

// https://born-again.test/api/all

struct ProfileBody: View {
  @State private var resources = [Resource]()

    var body: some View {
      
      VStack {
        ProfileHeader()
        
        List(resources, id: \.id) { resource in
          ResourceCard(resource: resource)
        }
        .listRowSpacing(10)
        .task {
          await fetchResources()
        }
          
      }
      
      
    }
  
  func fetchResources() async {
    guard let url = URL(string: "https://bornagain.app/api/all") else {
      print("Invalid URL")
      return
    }
    
    do {
      let request = URLRequest.addValue("application/json", forHTTPHeaderField: "Bearer")
      let (data, other) = try await URLSession.shared.data(from: url)
      
      if let decodedResponse = try? JSONDecoder().decode([Resource].self, from: data) {
        print(decodedResponse)
        resources = decodedResponse
      }
    } catch {
      print(error)
    }
  }

}

#Preview {
    ProfileBody()
}
