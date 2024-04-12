//
//  ProfileHeader.swift
//  Born Again
//
//  Created by Corbin Jensen on 4/12/24.
//

import SwiftUI

struct ProfileHeader: View {
    var body: some View {
        
      VStack(alignment: .leading) {
        
        Image(systemName: "person.crop.circle")
          .resizable()
          .scaledToFit()
          .frame(width: 80)
          .padding(.bottom)
        
        Text("Corbin Jensen")
          .font(.headline)
        Text("username.corbin")
          .font(.subheadline)
        
      }
      
    }
}

#Preview {
    ProfileHeader()
}
