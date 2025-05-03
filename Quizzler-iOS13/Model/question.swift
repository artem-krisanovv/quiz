//
//  question.swift
//  Quizzler-iOS13
//
//  Created by Артем Крисанов on 03.05.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let question: String
    let answers: String
    
    init(question: String, answers: String) {
        self.question = question
        self.answers = answers
    }
}
