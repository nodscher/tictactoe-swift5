//
//  GameViewController.swift
//  tic tac toe
//
//  Created by Robert Repnak on 17.10.15.
//  Copyright © 2015 Hanno Repnak. All rights reserved.
//

import UIKit

class GameStandardViewController: UIViewController {
    
    var selectedArray: [NSInteger] = [0,0,0,0,0,0,0,0,0];
    var lastUser: NSInteger = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func setItem(_ sender: UIButton)
    {
        var sign :String = "";
        let tag : NSInteger = sender.tag - 1000;
        if (tag < selectedArray.count)
        {
            if (selectedArray[tag] == 0)
            {
                selectedArray[tag] = lastUser;
                if (lastUser == 1)
                {
                    lastUser = 2;
                    sign = "X"
                } else
                {
                    lastUser = 1;
                    sign = "O"
                }
                sender.setTitle(sign,for: UIControl.State());
            }
        }
        if (isWinner(1))
        {
            var desc = SettingsManager.sharedInstance().getNamePlayer1();
            desc = desc + " hat gewonnen.";
            
            self.showDialog("Herzlichen Glückwunsch", description: desc);
            self.disableButtons();
        } else if (isWinner(2))
        {
            var desc = SettingsManager.sharedInstance().getNamePlayer2();
            desc = desc + " hat gewonnen.";
            self.showDialog("Herzlichen Glückwunsch", description: desc);
            self.disableButtons();
        } else if (isAllSet())
        {
            self.showDialog("Spiel beendet", description:"Unentschieden");
            self.disableButtons();
        }
        
    }
    
    @IBAction func newGame(_ sender: AnyObject) {
        selectedArray = [0,0,0,0,0,0,0,0,0];
        for i in 0...8
        {
            let button :UIButton = self.view.viewWithTag(1000+i) as! UIButton;
            button.setTitle("",for: UIControl.State());
            button.setTitleColor(UIColor.black, for: UIControl.State());
        }
        self.enableButtons();
        lastUser = 1;
    }
    
    @IBAction func prepareForUnwind(_ segue: UIStoryboardSegue) {
        
    }
    
    @IBAction override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func setButtonTextColorToRed(_ buttonIDs : [NSInteger]) {
        for buttonID in buttonIDs
        {
            let button :UIButton = self.view.viewWithTag(1000+buttonID) as! UIButton;
            button.setTitleColor(UIColor.red, for: UIControl.State());
        }
    }
    
    func isWinner(_ user:NSInteger) -> Bool
    {
        if ((selectedArray[0] == user) && (selectedArray[3] == user) && (selectedArray[6] == user))
        {
            setButtonTextColorToRed([0,3,6]);
            return true;
        } else if ((selectedArray[1] == user) && (selectedArray[4] == user) && (selectedArray[7] == user))
        {
            setButtonTextColorToRed([1,4,7]);
            return true;
        } else if ((selectedArray[2] == user) && (selectedArray[5] == user) && (selectedArray[8] == user))
        {
            setButtonTextColorToRed([2,5,8]);
            return true;
        } else if ((selectedArray[0] == user) && (selectedArray[1] == user) && (selectedArray[2] == user))
        {
            setButtonTextColorToRed([0,1,2]);
            return true;
        } else if ((selectedArray[3] == user) && (selectedArray[4] == user) && (selectedArray[5] == user))
        {
            setButtonTextColorToRed([3,4,5]);
            return true;
        } else if ((selectedArray[6] == user) && (selectedArray[7] == user) && (selectedArray[8] == user))
        {
            setButtonTextColorToRed([6,7,8]);
            return true;
        } else if ((selectedArray[0] == user) && (selectedArray[4] == user) && (selectedArray[8] == user))
        {
            setButtonTextColorToRed([0,4,8]);
            return true;
        } else if ((selectedArray[2] == user) && (selectedArray[4] == user) && (selectedArray[6] == user))
        {
            setButtonTextColorToRed([2,4,6]);
            return true;
        }
        
        
        return false;
    }
    
    
    func isAllSet() -> Bool
    {
        for value in selectedArray
        {
            if (value == 0)
            {
                return false;
            }
        }
        
        return true;
    }
    
    func showDialog(_ subject:String, description:String)
    {
        let alertView = UIAlertController(title: subject, message: description,preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
            // ...
        }
        alertView.addAction(OKAction)
        let newGameAction = UIAlertAction(title: "Neues Spiel", style: .default) { (action) in
            // ...
            self.newGame(NSNull());
        }
        alertView.addAction(newGameAction)
        self.present(alertView, animated: true, completion: nil)
    }
    
    func disableButtons()
    {
        for buttonID in 1000...1008
        {
            let button :UIButton = self.view.viewWithTag(buttonID) as! UIButton;
            button.isEnabled = false;
        }
    }
    
    func enableButtons()
    {
        for buttonID in 1000...1008
        {
            let button :UIButton = self.view.viewWithTag(buttonID) as! UIButton;
            button.isEnabled = true;
        }
    }
    
    
}
