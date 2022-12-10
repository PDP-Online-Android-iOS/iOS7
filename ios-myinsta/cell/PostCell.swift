//
//  PostCell.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 10/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct PostCell: View {
    
    var post: Post
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                VStack {
                    Image("ic_person")
                        .resizable()
                        .clipShape(Circle())
                        .frame(width: 45, height: 45)
                        .padding(.all, 2)
                }.overlay(RoundedRectangle(cornerRadius: 25).stroke(Utils.color2, lineWidth: 2))
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(post.title!)
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                    
                    Text(post.content!)
                        .foregroundColor(.gray)
                        .font(.system(size: 17))
                }.padding(.leading, 15)
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.black)
                }

            }
            .padding(.leading, 15).padding(.trailing, 15).padding(.top, 15)
            
            WebImage(url: URL(string: post.imgUrl!))
                .resizable()
                .scaledToFit()
                .padding(.top, 15)
            
            HStack(spacing: 0) {
                Button {
                    
                } label: {
                    Image(systemName: "heart")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black)
                }
                
                Button {
                    
                } label: {
                    Image(systemName: "arrowshape.turn.up.forward")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.black)
                }.padding(.leading, 15)
                
                Spacer()
            }.padding(.leading, 15).padding(.trailing, 15).padding(.top, 15)
            
            HStack {
                Text("Make a symbol breakpoiny at UIView, category on UIView listed in")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                Spacer()
            }
            .padding(.all, 15)
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(post: Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image2))
    }
}
