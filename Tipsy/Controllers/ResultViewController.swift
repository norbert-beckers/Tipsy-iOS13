//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Norbert Beckers on 05/05/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var tipResult : TipResult?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let safeResult = tipResult {
            totalLabel.text = String(format: "%0.2f", safeResult.amount)
            settingsLabel.text = "Split between \(safeResult.splitNumber), with \(tipPctToSting(safeResult.tipPct)) tip."
        }
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func tipPctToSting(_ tipPct: Float) -> String {
        return "\(Int(tipPct * 100))%"
    }
}
