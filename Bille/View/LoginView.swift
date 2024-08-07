//
//  LoginView.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 15/06/2024.
//

import SwiftUI


struct LoginView: View {
    @Environment(\.dismiss.self) var dismiss
    @Environment(UserVM.self) var userVM
    @Environment(\.managedObjectContext) private var context
    @State private var username: String = ""
    @State private var password: String = ""
    @Binding var isLogged: Bool
    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack(alignment:.leading){
                    HStack(){
                        Text("Login")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.teal)
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
                            .background(.teal)
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
                        .background(.teal)
                        .clipShape(.rect(cornerRadius: 10))
                        .tint(.gray)
                    
                    
                }.padding().foregroundStyle(.blue)
                
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
                        userVM.login(username: username, password: password, context: context)
                        isLogged = userVM.isLogged
                    }label: {
                        HStack{
                            Text("Login").bold()
                            Text("")
                            Image(systemName: "arrow.right").imageScale(.large).bold()
                        }
                        .font(.title2)
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(username == "" || password == "" ? .gray : .teal)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding()
                        .foregroundStyle(.white)
                    }.disabled(username == "" || password == "").navigationDestination(isPresented: $isLogged){
                        HomeScreen()
                    }
                    
                }
                
                Text("---------------------or--------------------")
                
                NavigationLink{
                    RegisterView().navigationBarBackButtonHidden(true)
                }label: {
                    Text("Register a new account")
                        .font(.title2)
                        .padding(12)
                        .frame(maxWidth: .infinity)
                        .background(.teal)
                        .clipShape(.rect(cornerRadius: 10))
                        .padding()
                        .foregroundStyle(.white)
                }.padding(.bottom,30)
            }.foregroundStyle(.gray)
        }
        
    }
    
}

