//
//  loginScreenViewController.swift
//  MovieApp
//
//  Created by Oscar Martinez on 8/16/22.
//

import UIKit
import FirebaseAuth
import SwiftUI

class loginScreenViewController: UIViewController {
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    @IBAction func segueGuestToView(_ sender: Any) {
        let vc = UIHostingController(rootView: MovieStore())
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func loginAction(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailText.text!, password: passwordText.text!) {
            (user, error) in
            if error == nil {
                let vc = UIHostingController(rootView: MovieStore())
                self.navigationController?.pushViewController(vc, animated: true)
            }
            else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}
