//
//  OutcomeViewController.swift
//  BmiApp
//
//  Created by 方錦泉 on 2019/2/21.
//  Copyright © 2019 方錦泉. All rights reserved.
//

import UIKit

class OutcomeViewController: UIViewController {
    
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var tvOutcome: UITextView!
    @IBAction func backClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let fileManager = FileManager()
        let dataUrl = fileInDocuments(fileName: "bmiData")
        if fileManager.fileExists(atPath: dataUrl.path){
            if let bmidata = try? Data(contentsOf: dataUrl){
                if let bmi = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(bmidata) as? Bmi {
                    valueLabel.text = "你的BMI是\(String(format: "%.2f",bmi.value))"
                    tvOutcome.text = bmi.show(value: bmi.value)
                } else{
                    tvOutcome.text = "error"
                }
            }
        }

        // Do any additional setup after loading the view.
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
