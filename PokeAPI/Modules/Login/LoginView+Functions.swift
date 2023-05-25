//
//  LoginView+Functions.swift
//  PokeAPI
//
//  Created by Cristian Misael Almendro Lazarte on 17/5/23.
//

import Foundation

extension LoginView {
    func getLogin(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else {
            messageAlert = "Please enter email and password"
            showAlert = true
            return
        }
        guard isValidEmail(email: email) else {
            messageAlert = "Email is not valid"
            showAlert = true
            return
        }
        
        isButtonEnabled = false
        
        viewModel.getLogin(email: email, password: password) { result, error in
            if result {
                DispatchQueue.main.async {
                    self.sessionManager.login()
                }
            } else {
                DispatchQueue.main.async {
                    self.messageAlert = error
                    self.showAlert = true
                }
            }
        }
    }
    
    private func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
}
