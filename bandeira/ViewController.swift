//
//  ViewController.swift
//  bandeira
//
//  Created by user220849 on 8/3/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    private var countries: [String] = [];
    private var score = 0;
    private var correctedAnswer = 0;

    // buttons
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
                                                                            
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the vier
        
        setupUI()
        addCountriesInArray()
        setupQuestion()

    }
    
    
    @IBAction func clickButton(_ sender: UIButton) {
        var title: String;
         
        if sender.tag == correctedAnswer {
            score += 1
            title = "Acertou!"
        }else{
            score -= 1
            title = "Errou!"
        }
        
        let alertController = UIAlertController(
            title: title,
            message: "Seu score: \(score)",
            preferredStyle: .alert
        )
        
        let continueAction = UIAlertAction(
            title: "Continue",
            style: .default,
            handler: setupQuestion
        )
        
        alertController.addAction(continueAction)
        present(alertController, animated: true)
    }
    
    
    func setupUI(){
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func addCountriesInArray(){
        countries = [
            "estonia",
            "france",
            "germany",
            "ireland",
            "italy",
            "monaco",
            "nigeria",
            "poland",
            "russia",
            "spain",
            "uk",
            "us"
        ]
    }
    
    func setupQuestion(action: UIAlertAction? = nil){
        countries.shuffle()
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        button1.tag = 0
        button2.tag = 1
        button3.tag = 2
        
        
        correctedAnswer = Int.random(in: 0...2)
        title = countries[correctedAnswer].uppercased()
    }

}



