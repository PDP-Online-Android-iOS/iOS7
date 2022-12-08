//
//  SignInScreen.swift
//  ios-myinsta
//
//  Created by Ogabek Matyakubov on 08/12/22.
//

import SwiftUI

struct SignInScreen: View {
    
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Utils.color1, Utils.color2]), startPoint: .top, endPoint: .bottom)
                
                VStack(spacing: 0) {
                    
                    Spacer()
                    
                    Text("Instagram")
                        .foregroundColor(.white)
                        .font(.system(size: 35))
                        .padding()
                    
                    TextField("Email", text: $email)
                        .frame(height: 50)
                        .padding(.leading, 10)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top, 10)
                    
                    SecureField("Password", text: $password)
                        .frame(height: 50)
                        .padding(.leading, 10)
                        .background(Color.white.opacity(0.4))
                        .cornerRadius(8)
                        .padding(.top, 10)
                    
                    Button {
                        
                    } label: {
                        Text("Sign In")
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
                            Text("Don't have an account")
                                .foregroundColor(.white)
                            
                            NavigationLink(destination: {
                                SignUpScreen()
                            }, label: {
                                Text("Sign Up")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            })
                        }
                    }.frame(maxWidth: .infinity, maxHeight: 50)
                    
                }.padding()
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
