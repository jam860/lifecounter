//
//  ViewController.swift
//  lifecounter
//
//  Created by James Nguyen on 4/18/25.
//

import UIKit

class ViewController: UIViewController {


//    @IBOutlet weak var player1life: UILabel!
//    @IBOutlet weak var player2life: UILabel!
//    @IBOutlet weak var gameActivity: UILabel!
//    var player1num : Int = 20;
//    var player2num : Int = 20;
    var lifeCounters : [Int] = [0, 20, 20, 20, 20, 20, 20, 20, 20] //8 players, 0 based array
    var lifeCounterVal : [Int] = [0, 5, 5, 5, 5, 5, 5, 5, 5] //8 players, 0 based array
    var labelRef : [UILabel] = [UILabel()]
    var currPlayers : Int = 0;
    var currRow : Int = 1;
    var loseLabel : UILabel = UILabel()
    let addPlayerButton = UIButton()
    var history : String = "";
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPlayerButton.setTitle( "Add Player", for: .normal)
        addPlayerButton.backgroundColor = .systemBlue
        addPlayerButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        addPlayerButton.frame = CGRect(x: 380, y: 130, width: 250, height: 50)
        addPlayerButton.addTarget(self, action: #selector(addPlayerToScreen), for: .touchUpInside)
        
        self.view.addSubview(addPlayerButton);
        for _ in 1...2 {
            addPlayer()
        }

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "SVCSegue":
//          let source = segue.source as! ViewController
          let destination = segue.destination as! ViewController2
          //destination.incomingText = source.txtData.text!
          // or
          destination.setIncomingText(incoming: history)
        default:
          NSLog("Unknown segue identifier -- " + segue.identifier!)
        }
      }
    
    func addPlayer() {
        currPlayers += 1
        var xCoord = 250
//            var yCoord = 250 * currRow
        if currPlayers > 2 && currPlayers % 2 != 0 {
            currRow += 1;
        }
        if currPlayers % 2 == 0 {
            xCoord = 550
        }
        
        
        let playerLabel = UILabel()
        playerLabel.text = "Player \(currPlayers)"
        playerLabel.tag = currPlayers
        playerLabel.font = UIFont.systemFont(ofSize: 40)
        playerLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        
        let lifeLabel = UILabel()
        lifeLabel.text = "Life Counter: 20"
        lifeLabel.tag = currPlayers
        lifeLabel.font = UIFont.systemFont(ofSize: 30)
        lifeLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
        labelRef.append(lifeLabel);
        
        let inputField = UITextField()
        inputField.tag = currPlayers
        inputField.text = "5"
        inputField.backgroundColor = .lightGray
        inputField.font = UIFont.systemFont(ofSize: 30)
        inputField.keyboardType = .numberPad
        inputField.textAlignment = .center
        inputField.addTarget(self, action: #selector(lifeCounterChange), for: .editingDidEndOnExit)
        
        let button = UIButton(type: .roundedRect)
        button.setTitle("5", for: .normal)
        button.tag = 20
        button.backgroundColor = .lightGray
//            button.frame = CGRect(x: 0, y: 0, width: 200, height: 80)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        let plusButton = UIButton(type: .roundedRect)
        plusButton.setTitle("+", for: .normal)
        plusButton.tag = currPlayers
        plusButton.backgroundColor = .systemTeal
//            plusButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        plusButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        plusButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        let minusButton = UIButton(type: .roundedRect)
        minusButton.setTitle("-", for: .normal)
        minusButton.backgroundColor = .systemTeal
//            minusButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        minusButton.tag = currPlayers
        minusButton.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        minusButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        let groupedButtonView = UIStackView(arrangedSubviews: [minusButton, inputField, plusButton])
        groupedButtonView.axis = .horizontal
        groupedButtonView.distribution = .fillEqually

        let stackView = UIStackView(arrangedSubviews: [playerLabel, lifeLabel, groupedButtonView])
        stackView.axis = .vertical
        stackView.frame = CGRect(x: xCoord, y: 200*currRow, width: 250, height: 200)
        
        stackView.distribution = .fillEqually
        
        self.view.addSubview(stackView)
    }
    
    @objc func addPlayerToScreen(_ sender: UIButton) {
        if currPlayers < 8 {
            addPlayer();
        }
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        if sender.titleLabel?.text == "+" {
            addPlayerButton.isEnabled = false;
            addPlayerButton.backgroundColor = .lightGray
            print("+")
            print(sender.tag)
            lifeCounters[sender.tag] = lifeCounters[sender.tag] + lifeCounterVal[sender.tag]
            labelRef[sender.tag].text = "Life Counter: \(lifeCounters[sender.tag])"
            print(lifeCounters)
            history += "Player \(sender.tag) gained \(lifeCounterVal[sender.tag]) HP \n"
        } else if sender.titleLabel?.text == "-" {
            addPlayerButton.isEnabled = false;
            addPlayerButton.backgroundColor = .lightGray
            print("-")
            print(sender.tag)
            lifeCounters[sender.tag] = lifeCounters[sender.tag] - lifeCounterVal[sender.tag]
            labelRef[sender.tag].text = "Life Counter: \(lifeCounters[sender.tag])"
            history += "Player \(sender.tag) lost \(lifeCounterVal[sender.tag]) HP \n"
            if lifeCounters[sender.tag] <= 0 {
                addPlayerButton.isEnabled = true;
                addPlayerButton.backgroundColor = .systemBlue
                loseLabel.text = "Player \(sender.tag) LOSES!"
                loseLabel.font = UIFont.boldSystemFont(ofSize: 30)
                loseLabel.frame = CGRect(x: 400, y: 1200, width: 400, height: 50)
                self.view.addSubview(loseLabel)
                print("lost")
            }
        }
    }
    
    
    @objc func lifeCounterChange(_ sender: UITextField) {
        var num: Int = 5;
        if let text = sender.text, let numUnwrapped = Int(text) {
            num = numUnwrapped
        }
        lifeCounterVal[sender.tag] = num;
        print(lifeCounterVal);
    }
}

