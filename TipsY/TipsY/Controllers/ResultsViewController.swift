//
//  ResultsViewController.swift
//  TipsY
//
//  Created by Александр Христиченко on 22.05.2022.
//

import UIKit

class ResultsViewController: UIViewController {

    var totalPrice: Double?
    var amountOfmen: String?
    var tipsAmount: Double?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
    }
}
