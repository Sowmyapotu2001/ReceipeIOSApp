//
//  RegistrationViewController.swift
//  IOSReceipe
//
//  Created by Sowmya potu on 11/18/24.
//

import UIKit
import FirebaseAuth
class RegistrationViewController: UIViewController {

    

    @IBOutlet weak var userNameOL: UITextField!
    
    
    @IBOutlet weak var emailOL: UITextField!
    
    
    @IBOutlet weak var passwordOL: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignUpButton(_ sender: Any) {
        
        
        handleSignup()
    }
    
    func handleSignup() {
        // Validate inputs
        guard let username = userNameOL.text, !username.isEmpty,
              let email = emailOL.text, !email.isEmpty,
              let password = passwordOL.text, !password.isEmpty else {
            print("Error: Missing fields")
            return
        }

        // Create user in Firebase Authentication
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
                return
            }

            guard let user = authResult?.user else { return }
            print("User registered: \(user.uid)")

            // Save additional details (username) in Firestore
            self.saveUserDetailsToFirestore(userID: user.uid, username: username, email: email)
        }
    }

    func saveUserDetailsToFirestore(userID: String, username: String, email: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userID).setData([
            "username": username,
            "email": email
        ]) { error in
            if let error = error {
                print("Error saving user details: \(error.localizedDescription)")
            } else {
                print("User details saved successfully!")
                // Navigate to the Login View Controller
                self.navigateToLogin()
            }
        }
    }

    func navigateToLogin() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            navigationController?.pushViewController(loginVC, animated: true)
        }
    }

    
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */

}
