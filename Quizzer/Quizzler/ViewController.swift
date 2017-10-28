//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestion = questionBank()
    var pickedAnswer : Bool = false
    var totalCount: Int = 0
    var scoreCount: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let firstQuestion = allQuestion.list[0]
//        questionLabel.text = firstQuestion.questionText
//
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if(sender.tag == 1){
            pickedAnswer = true
        }
        else if(sender.tag == 2){
            pickedAnswer = false
        }
        
        updateUI()
        
        checkAnswer()
        totalCount = totalCount + 1
        nextQuestion()
        
    }
    
    
    func updateUI() {
        progressLabel.text = "\(totalCount + 1)/13"
        progressBar.frame.size.width = (view.frame.size.width/13)*CGFloat(totalCount + 1)

    }
    

    func nextQuestion() {
        if(totalCount <= 12){
        let followingQuestion = allQuestion.list[totalCount]
        questionLabel.text =  followingQuestion.questionText
        }
        else {
            print("end of question Bank")
            let alertButton = UIAlertController(title: "Awesome", message: "You have successfully completed the test", preferredStyle: .alert)
            
            let oneButton = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            
            alertButton.addAction(oneButton)
            present(alertButton, animated: true, completion: nil)
            
        }
    }
    
    func changesForCorrectAnswer(){
        scoreCount = scoreCount + 1
        scoreLabel.text = "Score: \(scoreCount)"

    }
    
    func checkAnswer() {
        
        let getRightAnswer = allQuestion.list[totalCount].correct
        if(getRightAnswer == pickedAnswer){
            print("correct")
            ProgressHUD.showSuccess("Correct")
            changesForCorrectAnswer()
        }
        else {
            ProgressHUD.showError("Wrong")
            print("wrong choice")
        }
    }
    
    
    func startOver() {
        totalCount = 0
        nextQuestion()
    }
    

    
}
