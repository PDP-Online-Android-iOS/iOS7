//
//  HomeProfileScreen.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 09/12/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeProfileScreen: View {
    
    @EnvironmentObject var session: SessionStore
    
    @ObservedObject var viewModel = HomeProfileViewModel()
    
    @State var level = 2
    @State var coloumns: [GridItem] = Array(repeating: GridItem(.flexible(minimum: UIScreen.width/2 - 15), spacing: 10), count: 2)
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State private var isSheet = false
    @State private var isAlert = false
    
    func postSize() -> CGFloat {
        if level == 1 {
            return UIScreen.width / CGFloat(level) - 20
        }
        return UIScreen.width / CGFloat(level) - 15
    }
    
    func uploadPhoto() {
        let uid = session.user?.uid!
        if selectedImage != nil {
            viewModel.uploadProfileImage(uid: uid!, photo: selectedImage!)
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                if viewModel.isLoading {
                    ProgressView()
                }
                
                VStack(spacing: 0) {
                    ZStack {
                        VStack {
                            if viewModel.user != nil && viewModel.user!.imgUser != "" {
                                WebImage(url: URL(string: viewModel.user!.imgUser!))
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 70, height: 70)
                                    .padding(.all, 2)
                            } else {
                                Image("ic_person")
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 70, height: 70)
                                    .padding(.all, 2)
                            }
                            
                        }.overlay(RoundedRectangle(cornerRadius: 40).stroke(Utils.color2, lineWidth: 2))
                        
                        HStack {
                            Spacer()
                            VStack {
                                Spacer()
                                Button {
                                    self.isSheet.toggle()
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                        .resizable()
                                        .frame(width: 20, height: 20)
                                }
                                .confirmationDialog("Actions", isPresented: $isSheet, titleVisibility: .visible) {
                                    Button("Pick Photo") {
                                        self.sourceType = .photoLibrary
                                        self.isImagePickerDisplay = true
                                    }
                                    
                                    Button("Take Photo") {
                                        self.sourceType = .camera
                                        self.isImagePickerDisplay = true
                                    }
                                }
                                .sheet(isPresented: self.$isImagePickerDisplay, onDismiss: uploadPhoto) {
                                    ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                                }
                            }
                        }.frame(width: 77, height: 77)
                    }
                    
                    Text(viewModel.user?.displayName ?? "name")
                        .foregroundColor(.black)
                        .font(.system(size: 17))
                        .fontWeight(.medium)
                        .padding(.top, 15)
                    
                    Text(viewModel.user?.email ?? "email")
                        .foregroundColor(.gray)
                        .font(.system(size: 15))
                        .padding(.top, 3)
                    
                    // post, following, followers count
                    
                    HStack {
                        VStack {
                            Text("102")
                                .foregroundColor(.black)
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                            
                            Text("posts")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                        }.frame(maxWidth: UIScreen.width / 3, maxHeight: 60)    // Posts
                        
                        VStack{}.frame(maxWidth: 1, maxHeight: 25).background(Color.gray.opacity(0.5))
                        
                        VStack {
                            Text("232")
                                .foregroundColor(.black)
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                            
                            Text("followers")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                        }.frame(maxWidth: UIScreen.width / 3, maxHeight: 60)    // Followers
                        
                        VStack{}.frame(maxWidth: 1, maxHeight: 25).background(Color.gray.opacity(0.5))
                        
                        VStack {
                            Text("42")
                                .foregroundColor(.black)
                                .font(.system(size: 17))
                                .fontWeight(.medium)
                            
                            Text("following")
                                .foregroundColor(.gray)
                                .font(.system(size: 15))
                        }.frame(maxWidth: UIScreen.width / 3, maxHeight: 60)    // Following
                        
                    }.padding(.top, 10)
                    
                    // List or Grid View
                    HStack {
                        Spacer()
                        Image(systemName: "rectangle.grid.1x2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Utils.color2)
                            .onTapGesture {
                                level = 1
                                coloumns = Array(repeating: GridItem(.flexible(minimum: UIScreen.width / CGFloat(level) - 20)), count: 1)
                            }
                        Spacer()
                        Image(systemName: "square.grid.2x2")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .foregroundColor(Utils.color2)
                            .onTapGesture {
                                level = 2
                                coloumns = Array(repeating: GridItem(.flexible(minimum: UIScreen.width / CGFloat(level) - 15)), count: 2)
                            }
                        Spacer()
                    }.padding()
                    
                    // My Posts
                    ScrollView {
                        LazyVGrid(columns: coloumns, spacing: 0) {
                            ForEach(viewModel.posts, id: \.self) { post in
                                MyPostCell(post: post, length: postSize())
                            }
                        }
                    }.padding(.top, 10)
                    
                }.padding(.top, 20)
                
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                self.isAlert = true
            }, label: {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                    .foregroundColor(.black)
            }).alert(isPresented: $isAlert) {
                return Alert(title: Text("log_out"), message: Text("do_you_want_to_log_out"), primaryButton: .destructive(Text("confirm"), action: {
                    viewModel.apiSignOut()
                    SessionStore().listen()
                }), secondaryButton: .cancel())
            })
        }.onAppear() {
            let uid = (session.user!.uid)
            viewModel.apiLoadUser(uid: uid!)
            viewModel.apiPostList {
                print(viewModel.posts.count)
            }
        }
    }
}

struct HomeProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeProfileScreen()
    }
}
