//
//  ViewController.swift
//  TipsY
//
//  Created by Александр Христиченко on 22.05.2022.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var calculatorTips = CalculatorTips()
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        let senderTitle = sender.currentTitle
        if senderTitle == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if senderTitle == "10%" {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        } else {
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let zeroButton = zeroPctButton.isSelected
        let tenButton = tenPctButton.isSelected
        let twentyButton = twentyPctButton.isSelected
        let bill = billTextField.text!
        let amountOfMen = splitNumberLabel.text!
        
        calculatorTips.calculateMoney(zeroButton: zeroButton, tenButton: tenButton, twentyButton: twentyButton, bill: bill, amountOfMen: amountOfMen)
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPrice = calculatorTips.getSplitMoney()
            destinationVC.amountOfmen = calculatorTips.getMen()
            destinationVC.tipsAmount = calculatorTips.getTips()
        }
    }
}
