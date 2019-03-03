//
//  ViewController.swift
//  BmiApp
//
//  Created by 方錦泉 on 2019/2/21.
//  Copyright © 2019 方錦泉. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var tfHeight: UITextField!
    @IBOutlet weak var tfWeight: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    
    var bmi: Bmi?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        
        let dataUrl = fileInDocuments(fileName: "bmiData")
        do{
            let bmidata = try NSKeyedArchiver.archivedData(withRootObject: bmi!, requiringSecureCoding: true)
            try bmidata.write(to: dataUrl)
        }catch let error{
            print(error.localizedDescription)
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let height = Double(tfHeight.text ?? "") ?? -1
        let weight = Double(tfWeight.text ?? "") ?? -1
        if height < 0 || weight < 0 {
            tipLabel.text = "請輸入正確的數值"
            return false
        }else{
            bmi = Bmi(height: height, weight: weight)
            return true
        }
    }
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    


}

