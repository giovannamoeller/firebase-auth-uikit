//
//  LoginViewController.swift
//  LoginFirebaseiOS
//
//  Created by Giovanna Moeller on 25/11/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
  
  @IBOutlet var textFields: [UITextField]!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  
  var email: String = ""
  var password: String = ""
  
  let firebaseAuth: Auth? = .auth()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    passwordTextField.isSecureTextEntry = true
    loginButton.layer.cornerRadius = 8.0
    for textField in textFields {
      textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
      textField.leftViewMode = .always
      textField.layer.cornerRadius = 3.0
    }
  }
  @IBAction func buttonTapped(_ sender: Any) {
    email = emailTextField.text ?? ""
    password = passwordTextField.text ?? ""
    self.firebaseAuth?.signIn(withEmail: email, password: password) { data, error in
      if error != nil {
        let alert = UIAlertController(title: "Erro!", message: "Falha no login! Tente novamente.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
      } else {
        self.performSegue(withIdentifier: "moveToHomePage", sender: self)
      }
    }
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "moveToHomePage" {
      let controller = segue.destination as! HomeViewController
        controller.user = email
    }
  }
  
}
