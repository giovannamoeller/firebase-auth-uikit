//
//  ViewController.swift
//  LoginFirebaseiOS
//
//  Created by Giovanna Moeller on 25/11/21.
//

import UIKit
import Firebase

class ViewController: UIViewController {
  
  let firebaseAuth: Auth? = .auth()
  
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet var textFields: [UITextField]!
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    passwordTextField.isSecureTextEntry = true
    signUpButton.layer.cornerRadius = 8.0
    for textField in textFields {
      textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
      textField.leftViewMode = .always
      textField.layer.cornerRadius = 3.0
    }
  }
  
  @IBAction func buttonTapped(_ sender: Any) {
    let email = emailTextField.text ?? ""
    let password = passwordTextField.text ?? ""
    self.firebaseAuth?.createUser(withEmail: email, password: password) { data, error in
      if error != nil {
        print("Falha ao Cadastrar!")
      } else {
        let alert = UIAlertController(title: "Sucesso", message: "Sucesso no Cadastro!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Uhuuul", style: .default, handler: { _ in
          self.performSegue(withIdentifier: "moveToLoginPage", sender: self)
        }))
        self.present(alert, animated: true, completion: nil)
      }
    }
  }
}

