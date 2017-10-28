//
//  Question.swift
//  Quizzler
//
//  Created by Arinjay on 28/10/17.
//  Copyright © 2017 London App Brewery. All rights reserved.
//

import Foundation
class Question {
    
    var questionText: String
    var correct: Bool

    init(text:String,correctAnswer:Bool){
        questionText = text
        correct = correctAnswer
    }
}
