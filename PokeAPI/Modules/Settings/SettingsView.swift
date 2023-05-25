//
//  SettingsView.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 18/5/23.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var viewModel = SettingsViewModel()
    @ObservedObject var sessionManager: SessionManager
    @Environment(\.presentationMode) var presentationMode
    @State var test = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                
                Image(systemName: "person")
                    .resizable()
                    .foregroundColor(Color.gray)
                    .frame(width: 200, height: 200)
                    .padding(30)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(100)
                
                VStack(spacing: 10) {
                    Text("User Id:")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.currentUser?.id ?? "")
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                VStack(spacing: 10) {
                    Text("Created at:")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.currentUser?.createdAt ?? "")
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                VStack(spacing: 10) {
                    Text("Email:")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.currentUser?.email ?? "")
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                VStack(spacing: 10) {
                    Text("Password:")
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewModel.currentUser?.password ?? "")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(10)
                }
                Spacer()
                Button {
                    sessionManager.logout()
                    viewModel.logout()
                } label: {
                    Text("Logout")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("Psychic"))
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(sessionManager: SessionManager())
    }
}
