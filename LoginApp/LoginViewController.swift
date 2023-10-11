//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Alexey Efimov on 19/06/2019.
//  Copyright © 2019 Alexey Efimov. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    private var user = ""
    private var password = ""
    
    let users = User.getUsers()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as? UITabBarController
        tabBarController?.viewControllers?.forEach  { viewController in
            if let firstVC = viewController as? WelcomeViewController {
                firstVC.user = users
            } else if let navigationVC = viewController as? UINavigationController {
                let userInfoVC = navigationVC.topViewController
                guard let userInfoVC = userInfoVC as? ElizavetaViewController else {
                    return
                }
                userInfoVC.userTwo = users
            }
        }
    }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
        override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
            guard userNameTextField.text == users.user, passwordTextField.text == users.password else {
            showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: passwordTextField
            )
            return false
        }
        return true
    }
    
    @IBAction func forgotRegisterData(_ sender: UIButton) {
        sender.tag == 0
        ? showAlert(title: "Oops!", message: "Your name is \(users.user) 😉")
        : showAlert(title: "Oops!", message: "Your password is \(users.password) 😉")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
