//
//  RegisterView.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 15/06/2024.
//

import SwiftUI

struct RegisterView: View {
    @Environment(UserVM.self) var userVM
    @Environment(\.managedObjectContext) private var context
    @State var name: String = ""
    @State var lastname: String = ""
    @State var birthday: Date = Date()
    @State var address: String = ""
    @State var email: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var isActive: Bool = false
    @State var registrationMessage: String = ""
    @State var isRegistered: Bool = false
    @State var passwordPassed:Bool = false
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Register")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.pink)
                            .opacity(0.7)
                            .frame(alignment: .leading)
                        Spacer()
                    }.padding()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Name")
                                    .font(.title2)
                                    .foregroundStyle(.gray)
                                TextField("", text: $name, prompt: Text("Enter name").foregroundStyle(.white))
                                    .autocapitalization(.none)
                                    .frame(height: 20)
                                    .padding()
                                    .background(.pink)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .minLength(text: $name, length: 2, show: passwordPassed)
                                    .maxLength(text: $name, length: 15, show: false)
                            }.padding(.horizontal, 5)
                            
                            VStack(alignment: .leading) {
                                Text("Lastname")
                                    .font(.title2)
                                    .foregroundStyle(.gray)
                                TextField("", text: $lastname, prompt: Text("Enter lastname").foregroundStyle(.white))
                                    .autocapitalization(.none)
                                    .frame(height: 20)
                                    .padding()
                                    .background(.pink)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .maxLength(text: $lastname, length: 30, show: true)
                            }.padding(.horizontal, 5)
                        }.padding(.top, 20)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Address")
                                    .font(.title2)
                                    .foregroundStyle(.gray)
                                TextField("", text: $address, prompt: Text("Enter address").foregroundStyle(.white))
                                    .autocapitalization(.none)
                                    .frame(height: 20)
                                    .padding()
                                    .background(.pink)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .maxLength(text: $address, length: 20, show: false)
                            }.padding(.horizontal, 5)
                            
                            VStack(alignment: .leading) {
                                Text("Birthday")
                                    .font(.title2)
                                    .foregroundStyle(.gray)
                                DatePicker("", selection: $birthday, displayedComponents: .date)
                                    .frame(height: 20)
                                    .padding()
                                    .background(.pink)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                            }.padding(.horizontal, 5)
                        }.padding(.top, 10)
                        
                        VStack {
                            HStack {
                                Text("Email")
                                    .font(.title2)
                                    .foregroundStyle(.gray)
                                
                                Spacer()
                            }
                            TextField("", text: $email, prompt: Text("Enter email").foregroundStyle(.white))
                                .autocapitalization(.none)
                                .frame(height: 20)
                                .padding()
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .maxLength(text: $email, length: 50, show: false)
                            
                            HStack {
                                Text("Username")
                                    .font(.title2)
                                    .foregroundStyle(.gray)
                                Spacer()
                            }
                            TextField("", text: $username, prompt: Text("Enter username").foregroundStyle(.white))
                                .autocapitalization(.none)
                                .frame(height: 20)
                                .padding()
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .maxLength(text: $username, length: 12, show: false)
                            
                            HStack {
                                Text("Password")
                                    .font(.title2)
                                    .foregroundStyle(.gray)
                                Spacer()
                            }
                            SecureField("", text: $password, prompt: Text("Enter password").foregroundStyle(.white))
                                .frame(height: 20)
                                .padding()
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .minLength(text: $password, length: 3, show: passwordPassed)
                                .maxLength(text: $password, length: 5, show: false)
                        }.padding().foregroundStyle(.gray)
                        
                        HStack {
                            Spacer()
                            NavigationLink {
                                LoginView(isLogged: $isActive).navigationBarBackButtonHidden(true).environment(userVM)
                            } label: {
                                Text("Have an account? Sign In!")
                                    .foregroundStyle(.gray)
                            }
                        }.padding()
                        
                        VStack {
                            Button {
                                userVM.name = name
                                userVM.lastname = lastname
                                userVM.username = username
                                userVM.email = email
                                userVM.address = address
                                userVM.password = password
                                userVM.birthday = birthday
                                
                                if passwordPassed == true{
                                    if userVM.isUserRegistered(username: username, context: context) {
                                        registrationMessage = "User already registered"
                                        isRegistered = true
                                    } else {
                                        userVM.register(context: context)
                                        registrationMessage = "Registration successful"
                                        isRegistered = false
                                    }
                                }
                                
                                
                            } label: {
                                HStack {
                                    Text("Register now!").bold()
                                    Image(systemName: "arrow.right").imageScale(.large).bold()
                                }
                                .font(.title2)
                                .padding(22)
                                .frame(maxWidth: .infinity)
                                .background(.pink)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .padding()
                                .foregroundStyle(.white)
                            }
                            Text(registrationMessage)
                                .foregroundStyle(isRegistered ? .red : .green)
                        }.padding(.bottom, 30)
                        
                        
                    }
                    .padding(.horizontal, 10)
                }
            }
            .background(Color.white).foregroundStyle(.gray)
        }
    }
}

