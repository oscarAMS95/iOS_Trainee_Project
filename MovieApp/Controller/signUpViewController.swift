//
//  signUpViewController.swift
//  MovieApp
//
//  Created by Oscar Martinez on 8/16/22.
//

import UIKit
import FirebaseAuth

class signUpViewController: UIViewController {
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    @IBOutlet weak var checkboxTerms: UIButton! {
        didSet{
            checkboxTerms.setImage(UIImage(named: "circle_radio_unselected"), for: .normal)
            checkboxTerms.setImage(UIImage(named: "circle_radio_selected"), for: .selected)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func checkboxAction(_ sender: UIButton) {
        uncheck()
        sender.checkboxAnimation {
            print(sender.titleLabel?.text ?? "")
            print(sender.isSelected)
        }
        print(sender.tag)
    }
    
    func uncheck() {
        checkboxTerms.isSelected = false
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        if password.text != passwordConfirm.text {
            let alertController = UIAlertController(title: "Password is incorrect", message: "Please re-type the password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        } else {
            Auth.auth().createUser(withEmail: email.text!, password: password.text!){(user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "segueToLogin", sender: self)
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
}
    
extension UIButton {
    func checkboxAnimation(closure: @escaping () -> Void ) {
        guard let image = self.imageView else {return}
        self.adjustsImageWhenHighlighted = false
        self.isHighlighted = false
        
        UIView.animate(withDuration: 0.1, delay: 0.1, options: .curveLinear, animations: {
            image.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        }) { (success) in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
                self.isSelected = !self.isSelected
                closure()
                image.transform = .identity
            }, completion: nil)
        }
    }
}
