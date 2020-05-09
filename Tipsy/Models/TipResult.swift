//
//  TipResult.swift
//  Tipsy
//
//  Created by Norbert Beckers on 07/05/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct TipResult {
    let amount : Float
    let splitNumber: Int
    let tipPct: Float
    
    init(amount: Float, splitBy splitNumber: Int, tipPct: Float) {
        self.amount = amount
        self.splitNumber = splitNumber
        self.tipPct = tipPct
    }
}
