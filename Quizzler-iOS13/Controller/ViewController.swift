//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle ?? ""
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            questionLabel.textColor = .green
            Timer.scheduledTimer(timeInterval: 0.666, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
            quizBrain.nextQuestion()
        } else {
            questionLabel.textColor = .red
            Timer.scheduledTimer(timeInterval: 0.666, target: self, selector: #selector(anUpdateUi), userInfo: nil, repeats: false)
        }
    }
    
    @objc func updateUi() {
        questionLabel.text = quizBrain.getQuestionText()
        questionLabel.textColor = .white
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        firstButton.setTitle(quizBrain.getAnswers(buttonNumber: "0"), for: .normal)
        secondButton.setTitle(quizBrain.getAnswers(buttonNumber: "1"), for: .normal)
        thirdButton.setTitle(quizBrain.getAnswers(buttonNumber: "2"), for: .normal)
    }
    @objc func anUpdateUi() {
        questionLabel.textColor = .white
    }
    
}





