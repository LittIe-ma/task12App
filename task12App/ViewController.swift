//
//  ViewController.swift
//  task12App
//
//  Created by yasudamasato on 2021/04/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var taxExcludedField: UITextField!
    @IBOutlet private weak var taxRateField: UITextField!
    @IBOutlet private weak var taxIncludedLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = UserDefaults.standard.string(forKey: "text") {
            self.taxRateField.text = text
        }
    }

    private func taxRateCalculator(n: Double) -> Double {

        var tax: Double

        tax = n / 100 + 1

        return tax
    }

    @IBAction func didTapButton(_ sender: Any) {

        let taxExcludedPrice = Int(taxExcludedField.text!) ?? 0
        let taxRate = taxRateCalculator(n: Double(taxRateField.text!) ?? 0)

        let result = Int(Double(taxExcludedPrice) * taxRate)

        taxIncludedLabel.text = "\(result)"

        UserDefaults.standard.set(self.taxRateField.text, forKey: "text")
    }
}

