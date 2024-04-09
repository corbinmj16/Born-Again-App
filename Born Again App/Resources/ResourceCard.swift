//
//  ResourceCard.swift
//  Born Again
//
//  Created by Corbin Jensen on 4/9/24.
//

import SwiftUI

struct ResourceCard: View {
    var body: some View {
        
      VStack {
        HStack {
          Image(systemName: "person.fill")
            .resizable()
            .frame(width: 30, height: 30)
            .foregroundColor(.accent) // delete
            .clipShape(Circle())
            
          
          VStack(alignment: .leading) {
            Text("Corbin Jensen")
            Text("username.corbin")
              .font(.caption)
          }
          
          Spacer()
          
          Button(action: {
            print("Do something")
          }, label: {
            Image(systemName: "ellipsis")
              .rotationEffect(Angle(degrees: 90.0))
          })
        }
        .padding(.bottom)
        
        VStack(alignment: .leading) {
          Text("God Gives The Best Explanation of The Trinity In Isaiah - YouTube")
            .font(.headline)
            .padding(.bottom, 3)
          
          Text("God Gives the BEST Explanation of the Trinity in Isaiah 48:16 plus— Isaiah 43:10; 44:6-8; Zechariah 12:1-10.Isaiah 48:16 “Come near to Me, hear this:I have...")
            .font(.subheadline)
          
          Image(systemName: "photo")
            .resizable()
            .frame(maxHeight: 200)
            .aspectRatio(contentMode: .fit)
            .padding(.top)
            
        }
          
        
        
      }
      .padding(.horizontal)
    }
    
    
}

#Preview {
    ResourceCard()
}
