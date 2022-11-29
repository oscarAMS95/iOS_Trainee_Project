//
//  ViewController.swift
//  MovieApp
//
//  Created by Oscar Martinez on 5/31/22.
//

import UIKit
import FirebaseAuth

class startScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil {
          //  self.performSegue(withIdentifier: "", sender: nil)
        }
    }


}

