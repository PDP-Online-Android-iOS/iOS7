//
//  UserCell.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 10/12/22.
//

import SwiftUI

struct UserCell: View {
    
    var user: User
    
    var body: some View {
        HStack(spacing: 0) {
            VStack {
                Image("ic_person")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 45, height: 45)
                    .padding(.all, 2)
            }.overlay(RoundedRectangle(cornerRadius: 25).stroke(Utils.color2, lineWidth: 2))
            
            VStack(alignment: .leading, spacing: 3) {
                Text(user.displayName!)
                    .foregroundColor(.black)
                    .font(.system(size: 17))
                    .fontWeight(.medium)
                
                Text(user.email!)
                    .foregroundColor(.gray)
                    .font(.system(size: 17))
            }.padding(.all, 15)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("following")
                    .font(.system(size: 15))
                    .foregroundColor(.black.opacity(0.5))
                    .frame(width: 90, height: 30)
                    .overlay(RoundedRectangle(cornerRadius: 5).stroke(Color.gray, lineWidth: 1))
            }
        }.padding(.all, 15)
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell(user: User(uid: "1", email: "ogabekdev@gmail.com", displayName: "ogabekdev"))
    }
}
