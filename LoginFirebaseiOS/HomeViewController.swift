//
//  HomeViewController.swift
//  LoginFirebaseiOS
//
//  Created by Giovanna Moeller on 25/11/21.
//

import UIKit

class HomeViewController: UIViewController {
  
  var user: String?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let label = UILabel()
    view.addSubview(label)
    label.text = "Seja bem-vindo(a), \(user ?? "")"
    label.textColor = .white
    label.font = .boldSystemFont(ofSize: 18)
    label.translatesAutoresizingMaskIntoConstraints = false
    label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
  }
  
}
