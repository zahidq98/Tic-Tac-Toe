//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Codenation4 on 13/12/2018.
//  Copyright © 2018 Codenation4. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePLayer = 1 //Cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    
    let winningCombo = [[0,1,2],[3,4,5],[6,7,8],[0,3,6], [1,4,7], [2,5,8],[0,4,8],[2,4,6]]
    var gameIsActive = true
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: AnyObject) {
        
        if (gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePLayer
            
            if (activePLayer == 1)
            {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControl.State())
                activePLayer = 2
            }
            else {
                sender.setImage(UIImage(named: "Nought.png"), for: UIControl.State())
                activePLayer = 1
            }
        }
        
        for combintion in winningCombo{
            if gameState[combintion[0]] != 0 && gameState[combintion[0]] == gameState[combintion[1]] &&  gameState[combintion[1]] ==  gameState[combintion[2]]{
                gameIsActive = false
                
                if gameState[combintion[0]] == 1{
                    label.text = "Cross has won"
                }
                else
                {
                    label.text = "Nought has won"
                }
                
                playAgainButton.isHidden = false
                label.isHidden = false
                
            }
        }
        
        gameIsActive = false
        
        for i in gameState{
            if i == 0 {
               gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false{
            label.text = "Unlucky it was a draw"
            label.isHidden = false
            playAgainButton.isHidden = false
        }

    }
    
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgain(_ sender: Any) {
        
        gameState = [0,0,0,0,0,0,0,0,0]
        gameIsActive = true
        activePLayer = 1
        
        playAgainButton.isHidden = true
        label.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for:UIControl.State())
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

