//
//  SignUpScreen.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 08/12/22.
//

import SwiftUI

struct SignUpScreen: View {
    @EnvironmentObject var session: SessionStore
    @Environment(\.presentationMode) var presentation
    
    @ObservedObject var viewModel = SignUpViewModel()
    
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    @State var cPassword = ""
    
    func doSignUp() {
        if password == cPassword {
            if email.isValidEmail() && password.isValidPassword() {
                viewModel.apiSignUp(email: email, password: password, completion: { status in
                    if !status {
                        print("Please check email or password")
                    } else {
                        var user = User(email: email, displayName: fullname, password: password, imgUser: "")
                        user.uid = session.user?.uid
                        viewModel.apiSaveUser(user: user)
                        presentation.wrappedValue.dismiss()
                    }
                })
            } else {
                print("Please check email or password")
            }
        } else {
            print("Please check email or password")
        }
        
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Utils.color1, Utils.color2]), startPoint: .top, endPoint: .bottom)
                
                VStack(spacing: 0) {
                    
                    Spacer()
                    
                    Text("app_name")
                        .foregroundColor(.white)
                        .padding()
                        .font(Font.custom("Billabong", size: 45))
                    
                    TextField("fullname", text: $fullname)
                        .frame(height: 50)
                        .padding(.leading, 10)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top, 10)
                    
                    TextField("email", text: $email)
                        .frame(height: 50)
                        .padding(.leading, 10)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top, 10)
                    
                    SecureField("password", text: $password)
                        .frame(height: 50)
                        .padding(.leading, 10)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top, 10)
                    
                    SecureField("cpassword", text: $cPassword)
                        .frame(height: 50)
                        .padding(.leading, 10)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top, 10)
                    
                    Button {
                        doSignUp()
                    } label: {
                        Text("sign_up")
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 8)
                                .stroke(lineWidth: 1.5)
                                .foregroundColor(.white.opacity(0.8)))
                    }.padding(.top, 10)
                    
                    Spacer()

                    VStack {
                        HStack {
                            Text("already_have_an_account")
                                .foregroundColor(.white)
                            
                            Text("sign_in")
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .onTapGesture {
                                    presentation.wrappedValue.dismiss()
                                }
                        }
                    }.frame(maxWidth: .infinity, maxHeight: 50)
                    
                }.padding()
                
                if self.viewModel.isLoading {
                    ProgressView()
                }
            }
            .edgesIgnoringSafeArea(.all)
            .navigationBackButton(color: .white, text: "Back")
        }
    }
}

struct SignUpScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignUpScreen()
    }
}
