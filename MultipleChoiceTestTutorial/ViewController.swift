//
//  ViewController.swift
//  MultipleChoiceTestTutorial
//
//  Created by Maria Susana Moline Venanzi on 4/29/17.
//  Copyright © 2017 Uberbliss. All rights reserved.
// Test Rafa
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblQuestionLABEL: UILabel!
    @IBOutlet weak var lblChoice1LABEL: UIButton!
    @IBOutlet weak var lblChoice2LABEL: UIButton!
    @IBOutlet weak var lblChoice3LABEL: UIButton!
    @IBOutlet weak var lblChoice4LABEL: UIButton!
    @IBOutlet weak var lblCorrectOrWrongLABEL: UILabel!
    @IBOutlet weak var lblResetLABEL: UIButton!
    
  
    var listOfQuestions : [String] = ["Which is not a prime color" ,
                                      "63 / 9  = ?",
                                      " Computer Science is ?   ",
                                      " Chich has more cafeine ?   "]
    
    
    var listOfChoices : [[String]] = [["Blue","Green","Yellow","Red"],["7","8","7.5","6.8"],["Stupid","Boring","Awesome","Useless"],["Green Tea","Black tea","White tea","oolong Tea"]
                                      ]
    
    
    var listOfCorrectAnswer : [String] = ["Green","7","Awesome","Black tea"]
    
    var hasBeenAnswer : [Bool] = [false,false,false,false]
    
    var questionNumber : Int?
    var score = 0
    let maxScore : Int = 0
    var currentQuestion : String?
    var correctAnswer : String?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pressButton1(_ sender: UIButton) {
    }

    @IBAction func pressButton2(_ sender: UIButton) {
    }
    @IBAction func prssButton3(_ sender: UIButton) {
    }
    
    @IBAction func pressButton4(_ sender: UIButton) {
    }
    @IBAction func pressRessetButton(_ sender: UIButton) {
    }
    
    
    
    func setQuestionNumber(){
        questionNumber = Int(arc4random_uniform(UInt32(listOfQuestions.count)))
        if (hasBeenAnswer[questionNumber!] == true){
            setQuestionNumber()
        }
        setQuestionAndAnswer()
        setChoices()
    }
    
    
    func setQuestionAndAnswer(){
        currentQuestion = listOfQuestions[questionNumber!]
        lblQuestionLABEL.text = currentQuestion
        correctAnswer = listOfCorrectAnswer[questionNumber!]
    }
    
    
    func setChoices(){
        lblChoice1LABEL.setTitle(listOfChoices[questionNumber!][0], for: UIControlState.normal)
        lblChoice2LABEL.setTitle(listOfChoices[questionNumber!][1], for: UIControlState.normal)
        lblChoice3LABEL.setTitle(listOfChoices[questionNumber!][2], for: UIControlState.normal)
        lblChoice4LABEL.setTitle(listOfChoices[questionNumber!][3], for: UIControlState.normal)
        
    }
    
    
    
    func checkIfCorrect(userAnswer : String){
        hasBeenAnswer[questionNumber!] = true
        if (userAnswer == correctAnswer){
            score += 1
            lblCorrectOrWrongLABEL.text = " correct plus 1 point"
            lblCorrectOrWrongLABEL.backgroundColor = UIColor.green
        } else {
            lblCorrectOrWrongLABEL.text = " wrong nice try"
            lblCorrectOrWrongLABEL.backgroundColor = UIColor.red
        
            
        }
    }
    
    
    
    func checkIfEndGame(){
        
        var allAnswer : Bool = true
        for index in 0..<hasBeenAnswer.count{
            
            if (hasBeenAnswer[index] == false) {
            allAnswer = false
            }
            
        }
        if (allAnswer == true){
        InitiateEndGameSequence()
        } else {
        setQuestionNumber()
            
        }
    }
    
    
    func InitiateEndGameSequence(){
        lblQuestionLABEL.text = " game over " + String(score) + "/" + String(maxScore) + "points"
        lblChoice1LABEL.isEnabled = false
        lblChoice2LABEL.isEnabled = false
        lblChoice3LABEL.isEnabled = false
        lblChoice4LABEL.isEnabled = false
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

