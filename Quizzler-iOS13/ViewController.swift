//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    let quizzQuestions = [
        ["1+1 = 2?", "True"],
        ["1+2 = 3?", "True"],
        ["1+4 = 2?", "false"],
        ["2+2 = 4?", "True"]
    ]
    var questionNumber = 0
    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
       
        if quizzQuestions[questionNumber][1] == sender.titleLabel?.text {
            answerLabel.text = "CORRECT"
            answerLabel.textColor = UIColor.green
            answerLabel.alpha = 1
            textAnimation()
        } else {
            answerLabel.text = "INCORRECT"
            answerLabel.textColor = UIColor.red
            answerLabel.alpha = 1
            textAnimation()
        }
        
        func textAnimation() {
            UIView.animate(withDuration: 1, delay: 1) {
                self.answerLabel.alpha = 0
            }
        }
        
        let lastIndex = quizzQuestions.count - 1
        if questionNumber < lastIndex {
            questionNumber += 1
            updateQuestion()
            
        } else {
            questionLabel.text = "No more questions left."
        }

    }
    
    func updateQuestion() {
        
        questionLabel.text = quizzQuestions[questionNumber][0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.alpha = 0
        updateQuestion()
    }


}

