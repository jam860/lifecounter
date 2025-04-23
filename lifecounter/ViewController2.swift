//
//  ViewController.swift
//  lifecounter
//
//  Created by James Nguyen on 4/18/25.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var history: UILabel!
    var historyText : String = "";
    public var incomingText: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        history.text = historyText
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)

    }
    
    func setIncomingText(incoming: String) {
        print(incoming);
        historyText += incoming;
    }
}
