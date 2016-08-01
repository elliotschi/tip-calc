//
//  ViewController.swift
//  tip-calc
//
//  Created by elli chi on 7/31/16.
//  Copyright © 2016 elli chi. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {
  let dollarsFormatString = "$%.2f"
  let settings = UserDefaults.init()
  
  @IBOutlet weak var billAmountField: UITextField!
  @IBOutlet weak var calculatedTipLabel: UILabel!
  @IBOutlet weak var totalAmountLabel: UILabel!
  @IBOutlet weak var tipPercentageControl: UISegmentedControl!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // init labels
    let cachedBillAmount = settings.string(forKey: "billAmount")
    billAmountField.text = cachedBillAmount
    
    calculateAndRenderTip()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    let selectedTipPercentageIndex = settings.integer(forKey: "selectedTipPercentageIndex")
    tipPercentageControl.selectedSegmentIndex = selectedTipPercentageIndex
    calculateAndRenderTip()
  }

  @IBAction func onTap(_ sender: UITapGestureRecognizer) {
    view.endEditing(true)
  }
  
  @IBAction func onFormChange(_ sender: AnyObject) {
    calculateAndRenderTip()
  }
  
  @IBAction func onBillFieldBlur(_ sender: UITextField) {
    settings.set(billAmountField.text, forKey: "billAmount")
    settings.synchronize()
  }
  
  func calculateAndRenderTip() {
    let tipPercentages = [0.18, 0.2, 0.22]
    let selectedTipPercentage = tipPercentages[tipPercentageControl.selectedSegmentIndex]
    
    var billAmount = Double("0")
    
    if !(billAmountField.text?.isEmpty)! {
      billAmount = Double(billAmountField.text!)
    }
    
    let tipAmount = billAmount! * selectedTipPercentage
    let totalAmount = billAmount! + tipAmount
    
    calculatedTipLabel.text = String(format: dollarsFormatString, tipAmount)
    totalAmountLabel.text = String(format: dollarsFormatString, totalAmount)
  }
}

