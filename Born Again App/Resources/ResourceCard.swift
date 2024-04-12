//
//  ResourceCard.swift
//  Born Again
//
//  Created by Corbin Jensen on 4/9/24.
//

import SwiftUI

struct ResourceCard: View {
  @State private var isSharing = false;
  @State private var isSaved = false;
  
    var body: some View {
      VStack {
        // Profile image, name, username, ellipsis
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
        
        // title, description, image, category, date
        VStack(alignment: .leading) {
          
          Text("God Gives The Best Explanation of The Trinity In Isaiah - YouTube")
            .font(.headline)
            .padding(.bottom, 3)
          
          Text("God Gives the BEST Explanation of the Trinity in Isaiah 48:16 plus— Isaiah 43:10; 44:6-8; Zechariah 12:1-10.Isaiah 48:16 “Come near to Me, hear this:I have...")
            .font(.subheadline)
          
          // Category, Date
          HStack {
            Text("Video")
              .font(.footnote)
              .foregroundColor(.white)
              .padding(.horizontal, 10)
              .padding(.vertical, 3)
              .background(.blue)
              .clipShape(.capsule)
            
            Spacer()
            
            Label(
              title: { Text("April 10, 2024") },
              icon: { Image(systemName: "calendar") }
            )
            .font(.caption)
          }
        

          
          Image(systemName: "photo")
            .resizable()
            .scaledToFit()
//            .scaledToFill()
//            .frame(height: 200, alignment: .top)
            .clipped()
            .padding(.top)
            
        }
        
        HStack {
          Button(action: {
            isSharing.toggle()
          }, label: {
            Label(
              title: { Text("Share") },
              icon: {
                Image(systemName: "square.and.arrow.up")
              }
            )
          })
          .symbolEffect(.bounce.down.byLayer, value: isSharing)
          .font(.callout)
          
          Spacer()
          
          Button(action: {
            isSaved.toggle()
          }, label: {
            Label(
              title: { Text("Save") },
              icon: {
                Image(systemName: "bookmark")
              }
            )
          })
          .symbolEffect(.bounce.down.byLayer, value: isSaved)
          .font(.callout)
          
        }
//        .padding(.horizontal, 50)
//        .padding(.vertical, 10)

      }
    }
    
    
}

#Preview {
    ResourceCard()
}
