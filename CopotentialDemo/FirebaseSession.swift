//
//  FirebaseSession.swift
//  CopotentialDemo
//
//  Created by Vivek Patel on 07/10/20.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase

class FirebaseSession: ObservableObject {
   
    @Published var items: [UserData] = []
    var ref: DatabaseReference = Database.database().reference(withPath: "\(String(describing: Auth.auth().currentUser?.uid ?? "Error"))")
   
    func getData() {
        ref.observe(DataEventType.value) { (snapshot) in
            self.items = []
            for child in snapshot.children {
                if let snapshot = child as? DataSnapshot,
                    let toDo = UserData(snapshot: snapshot) {
                    self.items.append(toDo)
                }
            }
        }
    }
    
    func uploadData(name: String,email:String) {
        //Generates number going up as time goes on, sets order of TODO's by how old they are.
        let number = Int(Date.timeIntervalSinceReferenceDate * 1000)
        let postRef = ref.child(String(number))
        let post = UserData(name: name, email: email)
        postRef.setValue(post.toAnyObject())
    }

}

// MARK: -  Model

struct UserData: Identifiable {
    
    let ref: DatabaseReference?
    let key: String
    let name: String
    let email:String
    let id: String
    
    init(name: String,email:String, key: String = "") {
        self.ref = nil
        self.key = key
        self.name = name
        self.email = email
        self.id = key
        
    }
    
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let name = value["name"] as? String,
            let email = value["email"] as? String
            else {
                return nil
            }
        
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.name = name
        self.email = email
        self.id = snapshot.key
        
    }
    
    func toAnyObject() -> Any {
        return [
            "name":name ,
            "email": email,
        ]
    }
    
}
