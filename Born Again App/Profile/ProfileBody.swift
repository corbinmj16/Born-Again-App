//
//  ProfileBody.swift
//  Born Again
//
//  Created by Corbin Jensen on 4/12/24.
//

import SwiftUI

struct ProfileBody: View {
  @State var pickerSelction = "resources"
  
    var body: some View {
      VStack(alignment: .leading) {
        ProfileHeader()
        
        Picker("Resource Type", selection: $pickerSelction) {
          Text("Resources")
            .tag("resources")
          
          Text("Saved")
            .tag("saved")
        }
        .pickerStyle(.segmented)
      }
      .padding(.horizontal)
      
      
      List([1,2,3,4], id: \.self) {_ in
        ResourceCard()
      }
      .listRowSpacing(20)
      
    }
}

#Preview {
    ProfileBody()
}
