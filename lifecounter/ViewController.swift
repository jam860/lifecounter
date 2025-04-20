//
//  ViewController.swift
//  lifecounter
//
//  Created by James Nguyen on 4/18/25.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var player1life: UILabel!
    @IBOutlet weak var player2life: UILabel!
    @IBOutlet weak var gameActivity: UILabel!
    var player1num : Int = 20;
    var player2num : Int = 20;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        player1life.text = "Life Total: \(player1num)"
        player2life.text = "Life Total: \(player2num)"

    }
    
    @IBAction func player1plus(_ sender: Any) {
        player1num += 1;
        player1life.text = "Life Total: \(player1num)"
    }
    
    @IBAction func player1plus5(_ sender: Any) {
        player1num += 5;
        player1life.text = "Life Total: \(player1num)"
    }
    
  
    @IBAction func player1minus(_ sender: Any) {
        player1num -= 1;
        player1life.text = "Life Total: \(player1num)"
        if (player1num <= 0) {
            gameActivity.text = "Player 1 LOSES!"
        }
    }
    
    @IBAction func player1minus5(_ sender: Any) {
        player1num -= 5;
        player1life.text = "Life Total: \(player1num)"
        if (player1num <= 5) {
            gameActivity.text = "Player 1 LOSES!"
        }
    }
    
    @IBAction func player2plus(_ sender: Any) {
        player2num += 1;
        player2life.text = "Life Total: \(player2num)"
    }
    
    @IBAction func player2plus5(_ sender: Any) {
        player2num += 5;
        player2life.text = "Life Total: \(player2num)"
    }
    
    @IBAction func player2minus(_ sender: Any) {
        player2num -= 1;
        player2life.text = "Life Total: \(player2num)"
        
        if (player2num <= 0) {
            gameActivity.text = "Player 2 LOSES!"
        }
    }
    
    @IBAction func player2minus5(_ sender: Any) {
        player2num -= 5;
        player2life.text = "Life Total: \(player2num)"
        
        if (player2num <= 0) {
            gameActivity.text = "Player 2 LOSES!"
        }
    }
}

