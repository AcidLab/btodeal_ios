//
//  TypeViewController.swift
//  btodeal
//
//  Created by Mohamed Mokrani on 09/12/2018.
//  Copyright © 2018 Mohamed Mokrani. All rights reserved.
//

import UIKit
import BEMCheckBox

class TypeViewController: UIViewController {

    @IBOutlet weak var typeOne: BEMCheckBox!
    @IBOutlet weak var typeTwo: BEMCheckBox!
    var typeGroup:BEMCheckBoxGroup!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeGroup = BEMCheckBoxGroup(checkBoxes:[typeOne,typeTwo])

        // Do any additional setup after loading the view.
    }
    @IBAction func nextAction(_ sender: Any) {
        
        if(typeGroup.selectedCheckBox == typeOne) {
            performSegue(withIdentifier: "registrationSegue", sender: nil)
        }
        
        else {
            
            performSegue(withIdentifier: "categorySegue", sender: nil)
            
        }
        
    }
    @IBAction func closeAction(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
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
