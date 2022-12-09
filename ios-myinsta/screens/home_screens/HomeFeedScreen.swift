//
//  HomeFeedScreen.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 09/12/22.
//

import SwiftUI

struct HomeFeedScreen: View {
    @Binding var tabSelection: Int
    var body: some View {
        NavigationStack {
            ZStack {
                
            }
            .navigationTitle("app_name")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                self.tabSelection = 2
            }, label: {
                Image(systemName: "camera")
                    .foregroundColor(Utils.color2)
            }))
        }
    }
}

struct HomeFeedScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeFeedScreen(tabSelection: .constant(0))
    }
}
