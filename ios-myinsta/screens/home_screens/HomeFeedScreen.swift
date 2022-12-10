//
//  HomeFeedScreen.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 09/12/22.
//

import SwiftUI

struct HomeFeedScreen: View {
    @Binding var tabSelection: Int
    
    @ObservedObject var viewModel = HomeFeedViewModel()
    
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
            .navigationTitle("app_name")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                self.tabSelection = 2
            }, label: {
                Image(systemName: "camera")
                    .foregroundColor(Utils.color2)
            }))
            .onAppear() {
                viewModel.apiPostList {
                    print(viewModel.posts.count)
                }
            }
        }
    }
}

struct HomeFeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedScreen(tabSelection: .constant(0))
    }
}
