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
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle ?? "True"
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
    }
    @objc func anUpdateUi() {
        questionLabel.textColor = .white
    }
    
}





