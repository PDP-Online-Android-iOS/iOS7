//
//  HomeUploadScreen.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 09/12/22.
//

import SwiftUI

struct HomeUploadScreen: View {
    
    @Binding var tabSelection: Int
    @State var caption = ""
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    @State private var isSheet = false
    
    func uploadPost() {
        if caption.isEmpty || selectedImage == nil {
            return
        }
        
        // Send Post to Server
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    ZStack {
                        if selectedImage == nil {
                            Button {
                                isSheet.toggle()
                            } label: {
                                Image(systemName: "camera")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(Utils.color2)
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
                            .sheet(isPresented: self.$isImagePickerDisplay) {
                                ImagePickerView(selectedImage: self.$selectedImage, sourceType: self.sourceType)
                            }
                        } else {
                            Image(uiImage: selectedImage!)
                                .resizable()
                                .frame(maxWidth: UIScreen.width, maxHeight: UIScreen.width)
                                .scaledToFit()
                            
                            VStack {
                                HStack {
                                    Spacer()
                                    Button {
                                        selectedImage = nil
                                    } label: {
                                        Image(systemName: "xmark.square")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 25, height: 25)
                                    }
                                    .padding()
                                }
                                Spacer()
                            }
                        }

                    }
                    .frame(maxWidth: UIScreen.width, maxHeight: UIScreen.width)
                    .background(Color.gray.opacity(0.2))
                    
                    VStack {
                        TextField("Caption", text: $caption)
                            .font(Font.system(size: 17, design: .default))
                            .frame(height: 45)
                        Divider()
                    }
                    .padding(.top, 10).padding(.leading, 20).padding(.trailing, 20)
                    
                    Spacer()
                }
            }
            .navigationTitle("upload")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {
                self.tabSelection = 0
                self.uploadPost()
            }, label: {
                Image(systemName: "square.and.arrow.up")
                    .foregroundColor(Utils.color2)
            }))
        }
    }
}

struct HomeUploadScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeUploadScreen(tabSelection: .constant(2))
    }
}
