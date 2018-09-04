//
//  SignUpLastVC.swift
//  Hope-A-Thon
//
//  Created by Cifran on 04/09/18.
//  Copyright © 2018 Ferlix Yanto Wang. All rights reserved.
//

import UIKit

class SignUpLastVC: BaseSignUpViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    @IBOutlet weak var tapLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.addCharacterSpacing(kernValue: 2.25)
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tapLabel.alpha = 0
        welcomeLabel.transform = .init(scaleX: 0.01, y: 0.01)
        UIView.animate(withDuration: 1.5, delay: 0, options: .curveLinear, animations: {
            self.welcomeLabel.transform = .identity
        }) { (_) in
        }
        UIView.animate(withDuration: 1, delay: 2, options: .curveEaseOut, animations: {
            self.tapLabel.alpha = 1
        }, completion: nil)
    }
    
    override func userTapOnScreen(_ sender: UITapGestureRecognizer) {
        self.performSegue(withIdentifier: "next", sender: nil)
    }
}
