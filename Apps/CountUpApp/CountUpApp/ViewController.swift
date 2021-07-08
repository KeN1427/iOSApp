//
//  ViewController.swift
//  CountUpApp
//
//  Created by Ken Takahashi on 2021/06/20.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var counterLabel: UILabel!
    
    var counter: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCounter(counter: 0)
    }
    
    
    @IBAction func plus(_ sender: Any) {
        setCounter(counter: counter + 1)
    }
    

    @IBAction func minus(_ sender: Any) {
        setCounter(counter: counter - 1)
    }
    
    @IBAction func reset(_ sender: Any) {
        setCounter(counter: 0)
    }
    
    private func setCounter(counter: Int) {
        self.counter = counter
        counterLabel.text = String(counter)
    }
}

