//
//  TipsyModel.swift
//  Tipsy
//
//  Created by Norbert Beckers on 05/05/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipsyModel {
    var tipPct: Float
    var splitNumber: Int
    var amount : Float
    
    init(tipPct: Float, splitBy splitNumber: Int) {
        self.tipPct = tipPct
        self.splitNumber = splitNumber
        self.amount = 0.0
    }
    
    func getTip() -> TipResult {
        let tip = (amount * (1 + tipPct)) / Float(splitNumber)
        return TipResult(amount: tip, splitBy: splitNumber, tipPct: tipPct)
    }
    
    mutating func setSplitBy(_ splitNumber: Int) {
        self.splitNumber = splitNumber
    }
    
    mutating func setTipPct(_ tipPct: Float) {
        self.tipPct = tipPct
    }
    
    mutating func setAmount(_ amount: Float) {
        self.amount = amount
    }
}
