//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    let quizzQuestions = [
        ["1+1 = 2?", "True"],
        ["1+2 = 3?", "True"],
        ["1+4 = 2?", "False"],
        ["2+2 = 4?", "True"]
    ]
    var questionNumber = 0
    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
       
        progressBar.progress = Float(questionNumber + 1) / Float(quizzQuestions.count)
        
        if quizzQuestions[questionNumber][1] == sender.titleLabel?.text && sender.titleLabel?.text != "Restart"  {
            answerLabel.text = "CORRECT"
            answerLabel.textColor = UIColor.green
            answerLabel.alpha = 1
            textAnimation()
        } else if sender.titleLabel?.text != "Restart" {
            answerLabel.text = "INCORRECT"
            answerLabel.textColor = UIColor.red
            answerLabel.alpha = 1
            textAnimation()
        } else if sender.titleLabel?.text != "Restart" {
            questionNumber = 0
            viewDidLoad()
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
            trueBtn.isHidden = true
            falseBtn.isHidden = true
            restartBtn.isHidden = false
        }

    }
    
    
    @IBAction func restartBtnPressed(_ sender: UIButton) {
        questionNumber = 0
        updateQuestion()
        trueBtn.isHidden = false
        falseBtn.isHidden = false
        restartBtn.isHidden = true
        answerLabel.alpha = 0
        progressBar.progress = 0
    }
    
    func updateQuestion() {
        
        questionLabel.text = quizzQuestions[questionNumber][0]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartBtn.isHidden = true
        answerLabel.alpha = 0
        updateQuestion()
        progressBar.progress = 0
    }


}

