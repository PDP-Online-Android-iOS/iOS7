//
//  HomeSearchScreen.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 09/12/22.
//

import SwiftUI

struct HomeSearchScreen: View {
    
    @EnvironmentObject var session: SessionStore
    
    @ObservedObject var viewModel = HomeSearchViewModel()
    
    @State var keyword = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                }
                VStack {
                    TextField("Search for user", text: $keyword)
                        .padding(.leading, 15).padding(.trailing, 15)
                        .frame(height: 45)
                        .font(.system(size: 16))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black.opacity(0.5), lineWidth: 0.5))
                        .padding(.leading, 20).padding(.trailing, 20).padding(.top, 20)
                    
                    List {
                        ForEach(viewModel.users, id: \.self) { user in
                            UserCell(user: user)
                                .listRowInsets(EdgeInsets())
                                .buttonStyle(PlainButtonStyle())
                        }
                    }.listStyle(PlainListStyle())
                }
            }
            .navigationTitle("search")
            .navigationBarTitleDisplayMode(.inline)
        }.onAppear() {
            viewModel.apiUsersList(uid: session.user?.uid ?? "", keyword: keyword)
        }
    }
}

struct HomeSearchScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeSearchScreen()
    }
}
