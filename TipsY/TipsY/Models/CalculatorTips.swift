//
//  CalculatorTips.swift
//  TipsY
//
//  Created by Александр Христиченко on 22.05.2022.
//

import UIKit

struct CalculatorTips {
    var tips: Tips?
    let amountOfTip: [String: Double] = ["zeroTip": 0.0, "tenTip": 0.1, "twentyTip": 0.2]
    
    mutating func calculateMoney(zeroButton: Bool, tenButton: Bool, twentyButton: Bool, bill: String?, amountOfMen: String) {
    
        if zeroButton {
            tips = Tips(amountOfMoney: (Double(bill!)! * amountOfTip["zeroTip"]!  + Double(bill!)!) / Double(amountOfMen)!, amountOfTips: amountOfTip["zeroTip"]!, amountOfMen: amountOfMen)
        } else if tenButton {
            tips = Tips(amountOfMoney: (Double(bill!)! * amountOfTip["tenTip"]!  + Double(bill!)!) / Double(amountOfMen)!, amountOfTips: amountOfTip["tenTip"]!, amountOfMen: amountOfMen)
        } else if twentyButton {
            tips = Tips(amountOfMoney: (Double(bill!)! * amountOfTip["twentyTip"]!  + Double(bill!)!) / Double(amountOfMen)!, amountOfTips: amountOfTip["twentyTip"]!, amountOfMen: amountOfMen)
        }
    }
    
    func getTips() -> Double {
        return (tips?.amountOfTips)!
    }
    
    func getSplitMoney() -> Double {
        return tips!.amountOfMoney
    }
    
    func getMen() -> String {
        return tips!.amountOfMen
    }
}
