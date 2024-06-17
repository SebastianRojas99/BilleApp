//
//  LoginView.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 15/06/2024.
//

import SwiftUI

struct LoginView: View {
    @Environment(UserVM.self) private var userVM
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isActive: Bool = false
    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack(alignment:.leading){
                    HStack(){
                        Text("Login")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.pink)
                            .opacity(0.7)
                            .frame(alignment:.leading)
                        Spacer()
                    }.padding()
                    
                }
                VStack{
                    HStack{
                        Text("Username")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    VStack{
                        TextField("", text: $username,prompt: Text("Enter your username").foregroundStyle(.white))
                            .foregroundStyle(.white)
                            .autocapitalization(.none)
                            .frame(height: 20)
                            .padding()
                            .background(.pink)
                            .clipShape(.rect(cornerRadius: 10))
                    }
                    
                    
                    HStack{
                        Text("Password")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                    }
                    
                    SecureField("", text: $password,prompt: Text("Enter your password").foregroundStyle(.white))
                        .foregroundStyle(.white)
                        .frame(height: 20)
                        .padding()
                        .background(.pink)
                        .clipShape(.rect(cornerRadius: 10))
                        .tint(.gray)
                    
                    
                }.padding().foregroundStyle(.red)
                
                HStack{
                    Spacer()
                    Button{
                        
                    }label: {
                        Text("Forgot the password?")
                            .foregroundStyle(.gray)
                    }
                }.padding()
                
                VStack{
                    
                    Button{
                        if userVM.validation(_username: username, _password: password){
                            isActive = true
                        }
                    }label: {
                        HStack{
                            Text("Login").bold()
                            Text("")
                            Image(systemName: "arrow.right").imageScale(.large).bold()
                        }
                        .font(.title2)
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(username == "" || password == "" ? .gray : .pink)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding()
                        .foregroundStyle(.white)
                        
                        
                        
                    }.disabled(username == "" || password == "")
                    
                }
                
                .navigationDestination(
                    isPresented: $isActive,
                    destination:{
                        ContentView()
                            .navigationBarBackButtonHidden(true)
                            .environment(userVM)
                    })
                
                Text("---------------------or--------------------")
                
                NavigationLink{
                    RegisterView().navigationBarBackButtonHidden(true)
                }label: {
                    Text("Register a new account")
                        .font(.title2)
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(.pink)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding()
                        .foregroundStyle(.white)
                }.padding(.bottom,30)
            }.background(Color.white).foregroundStyle(.gray)
        }.background(.ultraThickMaterial)
        
    }
    
}

#Preview {
    LoginView().environment(UserVM())
}
