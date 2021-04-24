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

    private static let taxRateTextKey = "taxRateText"

    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = UserDefaults.standard.string(forKey: Self.taxRateTextKey) {
            taxRateField.text = text
        }
    }

    private func taxRateCalculator(n: Double) -> Double {
        n / 100 + 1
    }

    @IBAction func didTapButton(_ sender: Any) {

        let taxExcludedPrice = Int(taxExcludedField.text!) ?? 0
        let taxRate = taxRateCalculator(n: Double(taxRateField.text!) ?? 0)

        let result = Int(Double(taxExcludedPrice) * taxRate)

        taxIncludedLabel.text = "\(result)"

        UserDefaults.standard.set(taxRateField.text, forKey: Self.taxRateTextKey)
    }
}

