//
//  quizBrain.swift
//  Quizzler-iOS13
//
//  Created by Артем Крисанов on 03.05.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(question: "2+2=4", answers: "True"),
        Question(question: "967+2=969", answers: "True"),
        Question(question: "542*2=1084", answers: "True"),
        Question(question: "1290-476=389", answers: "False"),
        Question(question: "894*2=1788", answers: "True"),
        Question(question: "9548-2345=7203", answers: "True"),
        Question(question: "1452*2=2305", answers: "False"),
        Question(question: "658-392=266", answers: "False"),
        Question(question: "159*2=318", answers: "True"),
        Question(question: "Finnaly: 147-369=-222", answers: "True")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if questionNumber < quiz.count {
            if userAnswer == quiz[questionNumber].answers {
                score += 1
                return true
            } else {
                score -= 1
                return false
            }
        } else {
            return true
        }
    }
    
    func getQuestionText() -> String {
        if questionNumber < quiz.count  {
            return quiz[questionNumber].question
        } else {
            return quiz[0].question
        }
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    func getScore() -> Int {
        return score
    }
}

