//
//  ViewController.swift
//  first-project-dice
//
//  Created by Lauren Moor on 21/04/2020.
//  Copyright © 2020 Lauren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var randomNumber: UILabel!
    @IBOutlet weak var totalScore: UILabel!
    @IBOutlet weak var totalWinsOne: UILabel!
    @IBOutlet weak var totalWinsTwo: UILabel!
    @IBOutlet weak var winScoreOne: UILabel!
    @IBOutlet weak var winScoreTwo: UILabel!
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var shakeLabel: UILabel!
    @IBOutlet weak var heldMainPlayerOne: UILabel!
    @IBOutlet weak var heldMainPlayerTwo: UILabel!
    @IBOutlet weak var heldScorePlayerOne: UILabel!
    @IBOutlet weak var heldScorePlayerTwo: UILabel!
    
    var currentScore = 0
    var playerOneWins = 0
    var playerTwoWins = 0
    var playerOne = true
    var playerTwo = false
    var heldScoreOne = 0
    var heldScoreTwo = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumber.text = ""
        totalScore.text = "Current: "
        heldScorePlayerOne.text = "\(heldScoreOne)"
        heldScorePlayerTwo.text = "\(heldScoreTwo)"
        winScoreOne.text = "\(playerOneWins)"
        winScoreTwo.text = "\(playerTwoWins)"
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if (motion == .motionShake) {
            shakeLabel.text = "Shake iPhone to roll the dice!"
        }
        
        let numberGen = Int.random(in: 1...6)
        
        if (playerOne == true && playerTwo == false) {
            currentScore = numberGen + currentScore
            randomNumber.text = "\(numberGen)"
            totalScore.text = "Current: \(currentScore)"
            diceImage.image = UIImage(named: "dice\(numberGen)")
            
            if (numberGen == 1 && playerOne == true && playerTwo == false) {
                totalScore.text = "Player 1 you lose!"
                currentScore = 0
                mainTitle.text = "Player 2's turn"
                playerOne = false
                playerTwo = true
            }
        } else {
            currentScore = numberGen + currentScore
            randomNumber.text = "\(numberGen)"
            totalScore.text = "Current: \(currentScore)"
            diceImage.image = UIImage(named: "dice\(numberGen)")
            
            if (numberGen == 1 && playerTwo == true && playerOne == false) {
                totalScore.text = "Player 2 you lose!"
                currentScore = 0
                mainTitle.text = "Player 1's turn"
                playerOne = true
                playerTwo = false
            }
        }
    }
    
    @IBOutlet weak var diceImage: UIImageView!
    
    @IBAction func holdButton(_ sender: UIButton) {
        if (playerOne == true && playerTwo == false){
            heldScoreOne = heldScoreOne + currentScore
            heldScorePlayerOne.text = "\(heldScoreOne)"
            currentScore = 0
        }
        
        if (playerTwo == true && playerOne == false){
            heldScoreTwo = heldScoreTwo + currentScore
            heldScorePlayerTwo.text = "\(heldScoreTwo)"
            currentScore = 0
        }
        
        if (heldScoreOne > 99) {
            totalScore.text = "P1 wins with a score of \(heldScoreOne)!"
            playerOneWins = playerOneWins + 1
            winScoreOne.text = "\(playerOneWins)"
            currentScore = 0
            mainTitle.text = "Player 1's turn!"
            playerOne = true
            playerTwo = false
            heldScoreOne = 0
            heldScoreTwo = 0
            heldScorePlayerOne.text = "\(heldScoreOne)"
            heldScorePlayerTwo.text = "\(heldScoreTwo)"
        }
        
        if (heldScoreTwo > 99) {
            totalScore.text = "P2 wins with a score of \(heldScoreTwo)!"
            currentScore = 0
            playerTwoWins = playerTwoWins + 1
            winScoreTwo.text = "\(playerTwoWins)"
            mainTitle.text = "Player 2's turn!"
            playerOne = false
            playerTwo = true
            heldScoreOne = 0
            heldScoreTwo = 0
            heldScorePlayerOne.text = "\(heldScoreOne)"
            heldScorePlayerTwo.text = "\(heldScoreTwo)"
        }
    }

}
