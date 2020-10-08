//
//  Login.swift
//  CopotentialDemo
//
//  Created by Vivek Patel on 04/10/20.
//

import SwiftUI
import Firebase
struct LoginView: View {
    // MARK: - Variables
    @ObservedObject var info : AppDelegate
    @ObservedObject var session = FirebaseSession()
    @State private var name = ""
    @State private var email = ""
    @State private var showDisplay = false
    @State private var isAlert = false
    // MARK: - Body
    var body: some View {
        NavigationView{
            ZStack{
                Text("")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .background(LinearGradient(gradient: Gradient(colors: [.orange, .yellow, .white, .green, .blue]), startPoint: .top, endPoint: .bottom))
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    TextField("Name", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .padding()
                    
                    TextField("Email", text: $email)
                        .border(Color.black, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()
                    
                    NavigationLink( destination: DisplayView() ,isActive: $showDisplay) {
                        Button(action:{
                            guard !name.isEmpty else {
                                showAlert(message: "Please enter name")
                                return
                            }
                            guard !email.isEmpty, email.isValidEmail else {
                                showAlert(message: "Please enter a valid email")
                                return
                            }
                            session.uploadData(name: name, email: email)
                            self.showDisplay = true
                        }) {
                            Text("Submit")
                                .bold()
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color.gray)
                        }
                    }
                }
            }
        }
    }
    private func  actionSubmit() -> Bool  {
        guard name != "" else {
            showAlert(message: "Please enter name")
            return false
        }
        guard email != "", name.isValidEmail else {
            showAlert(message: "Please enter a valid email")
            return false
        }
        
        return true
    }
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Ok", style: .destructive, handler: nil)
        alert.addAction(cancel)
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: false, completion: nil)
    }
}
// MARK: - Utility Extension

extension String {
    var isValidEmail: Bool {
        let regularExpressionForEmail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let testEmail = NSPredicate(format:"SELF MATCHES %@", regularExpressionForEmail)
        return testEmail.evaluate(with: self)
    }
}
