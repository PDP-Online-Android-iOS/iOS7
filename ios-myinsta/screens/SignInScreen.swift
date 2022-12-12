//
//  SignInScreen.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 08/12/22.
//

import SwiftUI

struct SignInScreen: View {
    
    @ObservedObject var viewModel = SignInViewModel()
    
    @State var email = ""
    @State var password = ""
    
    func doSignIn() {
        if email.isValidEmail() && password.isValidPassword() {
            viewModel.apiSignIn(email: email, password: password, completion: { status in
                if !status {
                    print("Error from Firebase: Please check email or password")
                }
            })
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
                    
                    Button {
                        doSignIn()
                    } label: {
                        Text("sign_in")
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
                            Text("dont_have_an_account")
                                .foregroundColor(.white)
                            
                            NavigationLink(destination: {
                                SignUpScreen()
                            }, label: {
                                Text("sign_up")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            })
                        }
                    }.frame(maxWidth: .infinity, maxHeight: 50)
                    
                }.padding()
                
                if self.viewModel.isLoading {
                    ProgressView()
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SignInScreen_Previews: PreviewProvider {
    static var previews: some View {
        SignInScreen()
    }
}
