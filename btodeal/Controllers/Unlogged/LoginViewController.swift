//
//  LoginViewController.swift
//  btodeal
//
//  Created by Mohamed Mokrani on 08/12/2018.
//  Copyright © 2018 Mohamed Mokrani. All rights reserved.
//

import UIKit
import SwiftValidator
import EMAlertController

class LoginViewController: UIViewController,ValidationDelegate {
    

    @IBOutlet weak var loginItemButton: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    let validator = Validator()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //emailTF.becomeFirstResponder()
        
        validator.registerField(emailTF, rules: [RequiredRule(message: NSLocalizedString("Email obligatoire", comment: "required_email")), EmailRule(message: NSLocalizedString("Email non valide", comment: "invalid_email"))])
        
        validator.registerField(passwordTF, rules: [RequiredRule(message: NSLocalizedString("Mot de passe obligatoire", comment: "required_pass")),MinLengthRule(length: 6,message:NSLocalizedString("Minimum 6 caractéres", comment: "len_pass"))])

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //emailTF.becomeFirstResponder()
    }
    
    
    func validationSuccessful() {
        
        //let defaults = UserDefaults.standard
        //let token:String = defaults.string(forKey: "token")!
        //let parms: NSMutableDictionary? = ["login":emailText.text,"password":passwordText.text,"token":token,"device":"ios"]
        //webServiceManager.postLogin(parms)
        let uiBusy = UIActivityIndicatorView(activityIndicatorStyle: .white)
        uiBusy.hidesWhenStopped = true
        uiBusy.startAnimating()
        self.navigationController?.navigationBar.topItem!.rightBarButtonItem = UIBarButtonItem(customView: uiBusy)
        
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
    
    @IBAction func closeAction(_ sender: Any) {
        self.navigationController!.dismiss(animated: true, completion: nil)
    }
    @IBAction func loginAction(_ sender: Any) {
        
        validator.validate(self)
        
    }
    
    
    @IBAction func forgetPasswordAction(_ sender: Any) {
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
