import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var restartBtn: UIButton!
    @IBOutlet weak var trueBtn: UIButton!
    @IBOutlet weak var falseBtn: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartBtn.isHidden = true
        answerLabel.alpha = 0
        updateUI()
        progressBar.progress = quizBrain.getProgressBar()
    }
    
    @IBAction func answerBtnPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        progressBar.progress = quizBrain.getProgressBar()
        
        if sender.currentTitle != "Restart" {
            if userGotItRight {
                answerLabel.text = "CORRECT"
                answerLabel.textColor = UIColor.green
            } else {
                answerLabel.text = "INCORRECT"
                answerLabel.textColor = UIColor.red
            }
            answerLabel.alpha = 1
            textAnimation()
        }
        
        if quizBrain.nextQuestion() {
            updateUI()
        } else {
            endQuiz()
        }
    }
    
    @IBAction func restartBtnPressed(_ sender: UIButton) {
        quizBrain.reset()
        updateUI()
        restartBtn.isHidden = true
        trueBtn.isHidden = false
        falseBtn.isHidden = false
        answerLabel.alpha = 0
        progressBar.progress = quizBrain.getProgressBar()
    }
    
    func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgressBar()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
    }
    
    func endQuiz() {
        questionLabel.text = "No more questions left."
        trueBtn.isHidden = true
        falseBtn.isHidden = true
        restartBtn.isHidden = false
    }
    
    func textAnimation() {
        UIView.animate(withDuration: 1, delay: 1) {
            self.answerLabel.alpha = 0
        }
    }
}
