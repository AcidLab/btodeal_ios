//
//  ResetPasswordViewController.swift
//  btodeal
//
//  Created by Mohamed Mokrani on 08/12/2018.
//  Copyright © 2018 Mohamed Mokrani. All rights reserved.
//

import UIKit
import SwiftValidator
import EMAlertController

class ResetPasswordViewController: UIViewController,ValidationDelegate {

    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    let validator = Validator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailTF.becomeFirstResponder()
        
        validator.registerField(emailTF, rules: [RequiredRule(message: NSLocalizedString("Email obligatoire", comment: "required_email")), EmailRule(message: NSLocalizedString("Email non valide", comment: "invalid_email"))])
        
    }
    
    
    func validationSuccessful() {
        
    }
    
    func validationFailed(_ errors: [(Validatable, ValidationError)]) {
        
        var desc : String = String ()
        
        for (_, error) in errors {
            
            desc = desc+"\n"+""+error.errorMessage
            
        }
        
        
        let alertVC = EMAlertController(title:"ERREUR!", message: desc)
        alertVC.addAction(action: EMAlertAction(title: "OK", style: .cancel))
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
    
    @IBAction func resetAction(_ sender: Any) {
        
        validator.validate(self)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
