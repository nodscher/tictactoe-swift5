//
//  ViewController.swift
//  tic tac toe
//
//  Created by Robert Repnak on 17.10.15.
//  Copyright © 2015 Hanno Repnak. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func startGame(_ sender: AnyObject) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        var controlerId = "game_4x4";
        
        if (SettingsManager.sharedInstance().getNumberOfFields() == GlobalConstants.GAME_3x3)
        {
            controlerId = "game_3x3";
        }
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: controlerId) as UIViewController
        
        self.present(nextViewController, animated:true, completion:nil)
    }
    @IBAction func closeApp(_ sender: AnyObject) {
        exit(0);
    }
}

