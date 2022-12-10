//
//  MyPostCell.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 10/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct MyPostCell: View {
    
    var post: Post
    var length: CGFloat
    
    var body: some View {
        VStack(spacing: 0) {
            WebImage(url: URL(string: post.imgUrl!))
                .resizable()
                .frame(width: length, height: length / 2)
                .scaledToFit()
            
            Text("make a symbolic breakpoint at")
                .foregroundColor(.black)
                .font(.system(size: 16))
                .padding(.top, 10).padding(.bottom, 10)
                .frame(width: length)
        }
    }
}

struct MyPostCell_Previews: PreviewProvider {
    static var previews: some View {
        MyPostCell(post: Post(title: "ogabekdev", content: "December 10, 2022", imgUrl: Utils.image2), length: UIScreen.width)
    }
}
