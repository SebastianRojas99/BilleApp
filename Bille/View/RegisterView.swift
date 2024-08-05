//
//  RegisterView.swift
//  Bille
//
//  Created by Sebastian Marquez Rojas on 15/06/2024.
//

import SwiftUI


struct RegisterView: View {
    @State var userVM = UserVM()
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

    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Register")
                            .font(.largeTitle)
                            .bold()
                            .foregroundStyle(.cyan)
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
                                TextField("", text: $userVM.name, prompt: Text("Enter name").foregroundStyle(.white))
                                    .autocapitalization(.none)
                                    .frame(height: 20)
                                    .padding()
                                    .background(.cyan)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .maxLength(text: $name, length: 15, show: false)
                            }.padding(.horizontal, 5)
                            
                            VStack(alignment: .leading) {
                                Text("Lastname")
                                    .font(.title2)
                                    .foregroundStyle(.gray)
                                TextField("", text: $userVM.lastname, prompt: Text("Enter lastname").foregroundStyle(.white))
                                    .autocapitalization(.none)
                                    .frame(height: 20)
                                    .padding()
                                    .background(.cyan)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .maxLength(text: $lastname, length: 30, show: false)
                            }.padding(.horizontal, 5)
                        }.padding(.top, 20)
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("Address")
                                    .font(.title2)
                                    .foregroundStyle(.gray)
                                TextField("", text: $userVM.address, prompt: Text("Enter address").foregroundStyle(.white))
                                    .autocapitalization(.none)
                                    .frame(height: 20)
                                    .padding()
                                    .background(.cyan)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                    .maxLength(text: $address, length: 20, show: false)
                            }.padding(.horizontal, 5)
                            
                            VStack(alignment: .leading) {
                                Text("Birthday")
                                    .font(.title2)
                                    .foregroundStyle(.gray)
                                DatePicker("", selection: $userVM.birthday, displayedComponents: .date)
                                    .frame(height: 20)
                                    .padding()
                                    .background(.cyan)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                            }.padding(.horizontal, 5)
                        }.padding(.top, 10)
                        
                        VStack {
                            HStack {
                                Text("Email")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                
                                Spacer()
                            }
                            TextField("", text: $userVM.email, prompt: Text("Enter email").foregroundStyle(.white))
                                .autocapitalization(.none)
                                .frame(height: 20)
                                .padding()
                                .background(.cyan)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .maxLength(text: $email, length: 50, show: false)
                            
                            HStack {
                                Text("Username")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                Spacer()
                            }
                            TextField("", text: $userVM.username, prompt: Text("Enter username").foregroundStyle(.white))
                                .autocapitalization(.none)
                                .frame(height: 20)
                                .padding()
                                .background(.cyan)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .maxLength(text: $username, length: 12, show: false)
                            
                            HStack {
                                Text("Password")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                Spacer()
                            }
                            SecureField("", text: $userVM.password, prompt: Text("Enter password").foregroundStyle(.white))
                                .frame(height: 20)
                                .padding()
                                .background(.cyan)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .maxLength(text: $password, length: 5, show: false)
                        }.padding().foregroundStyle(.white)
                        
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
                                        userVM.register(context: context)
                                        registrationMessage = "Registration successful"
                                
                                
                            } label: {
                                HStack {
                                    Text("Register now!").bold()
                                    Image(systemName: "arrow.right").imageScale(.large).bold()
                                }
                                .font(.title2)
                                .padding(22)
                                .frame(maxWidth: .infinity)
                                .background(.cyan)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                                .padding()
                                .foregroundStyle(.white)
                            }
                            Text(registrationMessage)
                                .foregroundStyle(.green)
                        }.padding(.bottom, 30)
                        
                        
                    }
                    .padding(.horizontal, 10)
                }
            }
            .background(Color.white).foregroundStyle(.gray)
        }
    }
}

