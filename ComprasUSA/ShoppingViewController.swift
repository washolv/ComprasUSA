//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Francisco Washington de Almeida Oliveira on 16/12/21.
//

import UIKit

class ShoppingViewController: UIViewController {

    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    @IBOutlet weak var tfDolar: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmmount()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        setAmmount()
        tfDolar.resignFirstResponder()
    }
    func setAmmount(){
        tc.shoppingValue = tc.convertToDouble(tfDolar.text!)
        lbReal.text = tc.getFormattedValue(of: tc.shoppingValue * tc.dolar, withCurrency: "R$ ")
        let dolar = tc.getFormattedValue(of: tc.dolar, withCurrency: "")
        lbRealDescription.text = "Valor sem impostos (dólar \(tc.dolar))"
    }
    

}

