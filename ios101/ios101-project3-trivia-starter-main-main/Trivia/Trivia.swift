//
//  Trivia.swift
//  Trivia
//
//  Created by Fiyinfoluwa Afolayan on 9/30/23.
//

import Foundation
import UIKit

struct questionBank{
    let questionNumber: Int
    let category: String
    let questionPrompt: String
    let option1: String
    let option2: String
    let option3: String
    let option4: String
    let correctAnswer: answerSelect
    
}

enum answerSelect{
    case ans1
    case ans2
    case ans3
    case ans4
    case placeholder
}
