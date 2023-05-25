//
//  LoginView.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 17/5/23.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var messageAlert: String = ""
    
    @State var isButtonEnabled = true
    @State var showAlert: Bool = false
    
    @ObservedObject var viewModel = LoginViewModel()
    @ObservedObject var sessionManager: SessionManager
    
    var body: some View {
        VStack(spacing: 20) {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 350, height: 150, alignment: .center)
            HStack {
                Image(systemName: "person")
                    .foregroundColor(.gray)
                
                TextField("Username", text: $email)
                    .padding(.leading, 10)
                    .keyboardType(.emailAddress)
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            
            HStack {
                Image(systemName: "lock")
                    .foregroundColor(.gray)
                
                SecureField("Password", text: $password)
                    .padding(.leading, 10)
                
            }
            .padding()
            .background(Color.gray.opacity(0.2))
            .cornerRadius(10)
            Button(action: {
                getLogin(email: email, password: password)
            }) {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color("Psychic"))
                    .cornerRadius(10)
            }
            .disabled(!isButtonEnabled)
        }
        .padding(40)
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Alert"),
                message: Text(messageAlert),
                dismissButton: .default(Text("OK"))
            )
        }
        .onAppear() {
            isButtonEnabled = true
        }
    }
}

