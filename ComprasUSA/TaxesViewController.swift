//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Francisco Washington de Almeida Oliveira on 17/12/21.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTax: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbStatetaxDescription: UILabel!
    @IBOutlet weak var swCreditCards: UISwitch!
    @IBOutlet weak var lbReal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        calculateTaxes()
    }
    func calculateTaxes(){
        lbStatetaxDescription.text = "Imposto do Estado (\(tc.getFormattedValue(of: tc.stateTax, withCurrency: ""))"
        lbIOFDescription.text = "IOF (\(tc.getFormattedValue(of: tc.stateTax, withCurrency: ""))%"
        lbDolar.text = tc.getFormattedValue(of: tc.shoppingValue, withCurrency: "US$")
        lbStateTax.text = tc.getFormattedValue(of: tc.stateTaxValue, withCurrency: "US$")
        lbIOF.text = tc.getFormattedValue(of: tc.iofValue, withCurrency: "US$")
        
        let real = tc.calculate(usingCreditCard: swCreditCards.isOn)
        lbReal.text = tc.getFormattedValue(of: real, withCurrency: "R$")
    }

    @IBAction func changeIof(_ sender: Any) {
        calculateTaxes()
    }
}
