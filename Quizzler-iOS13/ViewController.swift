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
        Question(q: "A slug's blood is green.", a: "True"),
                Question(q: "Approximately one quarter of human bones are in the feet.", a: "True"),
                Question(q: "The total surface area of two human lungs is approximately 70 square metres.", a: "True"),
                Question(q: "In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.", a: "True"),
                Question(q: "In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.", a: "False"),
                Question(q: "It is illegal to pee in the Ocean in Portugal.", a: "True"),
                Question(q: "You can lead a cow down stairs but not up stairs.", a: "False"),
                Question(q: "Google was originally called 'Backrub'.", a: "True"),
                Question(q: "Buzz Aldrin's mother's maiden name was 'Moon'.", a: "True"),
                Question(q: "The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.", a: "False"),
                Question(q: "No piece of square dry paper can be folded in half more than 7 times.", a: "False"),
                Question(q: "Chocolate affects a dog's heart and nervous system; a few ounces are enough to kill a small dog.", a: "True")

 ]
    
    var questionNumber = 0
    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
       
        progressBar.progress = Float(questionNumber + 1) / Float(quizzQuestions.count)
        
        if quizzQuestions[questionNumber].answer == sender.titleLabel?.text && sender.titleLabel?.text != "Restart"  {
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
        
        questionLabel.text = quizzQuestions[questionNumber].text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartBtn.isHidden = true
        answerLabel.alpha = 0
        updateQuestion()
        progressBar.progress = 0
    }


}

