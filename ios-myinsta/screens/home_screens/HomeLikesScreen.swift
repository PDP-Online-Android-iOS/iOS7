//
//  HomeLikesScreen.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 09/12/22.
//

import SwiftUI

struct HomeLikesScreen: View {
    
    @ObservedObject var viewModel = HomeLikesViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                }
                
                List {
                    ForEach(viewModel.posts, id: \.self) { post in
                        PostCell(post: post)
                            .listRowInsets(EdgeInsets())
                    }
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("likes")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear() {
                viewModel.apiPostList {
                    print(viewModel.posts.count)
                }
            }
        }
    }
}

struct HomeLikesScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeLikesScreen()
    }
}
