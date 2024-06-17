//
//  RegisterView.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 15/06/2024.
//

import SwiftUI

struct RegisterView: View {
    @Environment(UserVM.self) private var userVM
    @State var name:String = ""
    @State var lastname:String = ""
    @State var birthday:String = ""
    @State var address:String = ""
    @State var email:String = ""
    @State var username:String = ""
    @State var password:String = ""
    @State var isActive:Bool = false
    var body: some View {
        NavigationStack{
            ScrollView{
                
                VStack(alignment:.leading){
                    HStack(){
                        Text("Register")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.pink)
                            .opacity(0.7)
                            .frame(alignment:.leading)
                        Spacer()
                    }.padding()
                    
                }
                
                HStack{
                    
                    VStack(alignment:.leading){
                        Text("Name")
                            .font(.title2)
                            .foregroundStyle(.gray)
                            .frame(alignment: .leading)
                        Spacer()
                        TextField("", text: $username,prompt: Text("Enter name").foregroundStyle(.white))
                            .autocapitalization(.none)
                            .frame(height: 20)
                            .padding()
                            .background(.pink)
                            .clipShape(.rect(cornerRadius: 10))
                        
                    }.padding(.horizontal,5)
                    
                    VStack(alignment:.leading){
                        Text("Lastname")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Spacer()
                        TextField("", text: $username,prompt: Text("Enter lastname").foregroundStyle(.white))
                            .autocapitalization(.none)
                            .frame(height: 20)
                            .padding()
                            .background(.pink)
                            .clipShape(.rect(cornerRadius: 10))
                        
                    }.padding(.horizontal,5)
                }.padding(.top,20)
                
                HStack{
                    
                    VStack(alignment:.leading){
                        Text("Address")
                            .font(.title2)
                            .foregroundStyle(.gray)
                            .frame(alignment: .leading)
                        Spacer()
                        TextField("", text: $username,prompt: Text("Enter address").foregroundStyle(.white))
                            .autocapitalization(.none)
                            .frame(height: 20)
                            .padding()
                            .background(.pink)
                            .clipShape(.rect(cornerRadius: 10))
                        
                    }.padding(.horizontal,5)
                    
                    VStack(alignment:.leading){
                        Text("Birthday")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Spacer()
                        TextField("", text: $username,prompt: Text("Enter birthday").foregroundStyle(.white))
                            .autocapitalization(.none)
                            .frame(height: 20)
                            .padding()
                            .background(.pink)
                            .clipShape(.rect(cornerRadius: 10))
                        
                    }.padding(.horizontal,5)
                }.padding(.top,10)
                
                
                VStack{
                    HStack{
                        Text("Email")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    TextField("", text: $username,prompt: Text("Enter email").foregroundStyle(.white))
                        .autocapitalization(.none)
                        .frame(height: 20)
                        .padding()
                        .background(.pink)
                        .clipShape(.rect(cornerRadius: 10))
                    
                    HStack{
                        Text("Username")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Spacer()
                    }
                    TextField("", text: $username,prompt: Text("Enter username").foregroundStyle(.white))
                        .autocapitalization(.none)
                        .frame(height: 20)
                        .padding()
                        .background(.pink)
                        .clipShape(.rect(cornerRadius: 10))
                    
                    HStack{
                        Text("Password")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        
                        Spacer()
                        
                    }
                    
                    SecureField("", text: $password,prompt: Text("Enter password").foregroundStyle(.white))
                        .frame(height: 20)
                        .padding()
                        .background(.pink)
                        .clipShape(.rect(cornerRadius: 10))
                    
                    
                }.padding().foregroundStyle(.gray)
                
                HStack{
                    Spacer()
                    NavigationLink{
                        LoginView().navigationBarBackButtonHidden(true)
                    }label: {
                        Text("Have account?, Sign In!")
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
                            Text("Register now!").bold()
                            Text("")
                            Image(systemName: "arrow.right").imageScale(.large).bold()
                        }
                        .font(.title2)
                        .padding(22)
                        .frame(maxWidth: .infinity)
                        .background(.pink)
                        .clipShape(.rect(cornerRadius: 15))
                        .padding()
                        .foregroundStyle(.white)
                        
                        
                        
                    }
                    
                }
                .padding(.bottom,30)
                
                .navigationDestination(
                    isPresented: $isActive,
                    destination:{
                        ContentView()
                            .navigationBarBackButtonHidden(true)
                    })
            }.background(Color.white).foregroundStyle(.gray)
        }
        
    }
    
}

#Preview {
    RegisterView().environment(UserVM())
}
