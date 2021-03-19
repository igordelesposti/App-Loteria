//
//  ViewController.swift
//  Loteria
//
//  Created by Igor Delesposti on 19/03/21.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var lbGameType: UILabel!
  @IBOutlet weak var scGameType: UISegmentedControl!
  @IBOutlet var balls: [UIButton]!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func generateGame() {
  }

}

