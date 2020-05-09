//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextFlield: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberField: UILabel!
    
    let resultSegueId = "goToResult"
    
    var tipsyModel: TipsyModel?
    var tipResult : TipResult?

    override func viewDidLoad() {
        super.viewDidLoad()     
        tipsyModel = TipsyModel(tipPct: 0.1, splitBy: 2)
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        billTextFlield.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        tipsyModel!.setTipPct(parse(tipPctText: sender.currentTitle!))
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberField.text = String(Int(sender.value))
        tipsyModel!.setSplitBy(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        tipsyModel!.setAmount(Float(billTextFlield.text!) ?? 0.0)
        
        tipResult = tipsyModel?.getTip()
        
        performSegue(withIdentifier: resultSegueId, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == resultSegueId {
            let destination = segue.destination as! ResultViewController
            print("tipResult is not nil : \(tipResult != nil)")
            destination.tipResult = tipResult
        }
    }
    
    func parse(tipPctText: String) -> Float {
        return Float(tipPctText.dropLast())! / 100.0
    }
}

