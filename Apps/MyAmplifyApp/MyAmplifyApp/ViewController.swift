//
//  ViewController.swift
//  MyAmplifyApp
//
//  Created by 高橋賢 on 2021/07/08.
//

import UIKit
import Amplify

class ViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if Amplify.Auth.getCurrentUser() != nil {
            messageLabel.text = "ログインしています"
        } else {
            messageLabel.text = "ログインしてください"
        }
    }
    
    
    @IBAction func logIn(_ sender: Any) {
        let username = usernameTextField.text!
        let password = passwordTextField.text!
        
        signIn(username: username, password: password)
    }
    

    @IBAction func logOut(_ sender: Any) {
        signOut()
    }
    


    func signIn(username: String, password: String) {
        Amplify.Auth.signIn(username: username, password: password) { result in
            switch result {
            case .success:
                self.changeMessage(message: "ログイン成功！")
                print("Sign in succeeded")
            case .failure(let error):
                self.changeMessage(message: "ログイン失敗…")
                print("Sign in failed \(error)")
            }
        }
    }
    
    func signOut() {
        Amplify.Auth.signOut(options: .init(globalSignOut: true)) { result in
            switch result {
            case .success:
                self.changeMessage(message: "ログアウトしました")
                self.resetTextField()
                print("Successfully signed out")
            case .failure(let error):
                self.changeMessage(message: "ログアウトに失敗しました")
                print("Sign out failed with error \(error)")
            }
        }
    }
    
    func changeMessage(message: String) {
        DispatchQueue.main.async {
            self.messageLabel.text = message
        }
    }
    
    func resetTextField() {
        DispatchQueue.main.async {
            self.usernameTextField.text = ""
            self.passwordTextField.text = ""
        }
    }
}
