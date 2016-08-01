//
//  SettingsViewController.swift
//  tip-calc
//
//  Created by elli chi on 7/31/16.
//  Copyright © 2016 elli chi. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
  let defaultSettings = UserDefaults.init()
  
  @IBOutlet weak var defaultTipPercentageControl: UISegmentedControl!
  
    override func viewDidLoad() {
      super.viewDidLoad()
      defaultTipPercentageControl.selectedSegmentIndex = defaultSettings.integer(forKey: "selectedTipPercentageIndex")
    }
  
  @IBAction func onSettingsChange(_ sender: AnyObject) {
    print(defaultTipPercentageControl.selectedSegmentIndex)
    defaultSettings.set(defaultTipPercentageControl.selectedSegmentIndex, forKey: "selectedTipPercentageIndex")
    defaultSettings.synchronize()
  }
}
