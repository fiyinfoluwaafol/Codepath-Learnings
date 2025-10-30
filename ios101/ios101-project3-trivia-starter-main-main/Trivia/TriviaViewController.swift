//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Fiyinfoluwa Afolayan on 9/29/23.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var questionTracker: UILabel!
    
    @IBOutlet weak var questionCategory: UILabel!
    
    @IBOutlet weak var currentQuestion: UILabel!
    
    @IBAction func option1IsTapped(_ sender: UIButton) {
        selectedQuestion = min(questions.count - 1, selectedQuestion + 1)
        configure(with: questions[selectedQuestion])
        selectedAnswer = answerSelect.ans1
        if selectedAnswer == questions[selectedQuestion].correctAnswer{
            score += 1
        }
        print("Score is \(score)")
        print("opt1 selected")
    }
    
    @IBAction func option2IsTapped(_ sender: UIButton) {
        selectedQuestion = min(questions.count - 1, selectedQuestion + 1)
        configure(with: questions[selectedQuestion])
        selectedAnswer = answerSelect.ans2
        if selectedAnswer == questions[selectedQuestion].correctAnswer{
            score += 1
        }
        print("Score is \(score)")
        print("opt2 selected")
    }
    
    @IBAction func option3IsTapped(_ sender: UIButton) {
        selectedQuestion = min(questions.count - 1, selectedQuestion + 1)
        configure(with: questions[selectedQuestion])
        selectedAnswer = answerSelect.ans3
        if selectedAnswer == questions[selectedQuestion].correctAnswer{
            score += 1
        }
        print("Score is \(score)")
        print("opt3 selected")
    }
    
    @IBAction func option4IsTapped(_ sender: UIButton) {
        selectedQuestion = min(questions.count - 1, selectedQuestion + 1)
        configure(with: questions[selectedQuestion])
        selectedAnswer = answerSelect.ans4
        if selectedAnswer == questions[selectedQuestion].correctAnswer{
            score += 1
        }
        print("Score is \(score)")
        print("opt4 selected")
    }
    
    
    @IBOutlet weak var opt1: UIButton!
    
    @IBOutlet weak var opt2: UIButton!
    
    @IBOutlet weak var opt3: UIButton!
    
    @IBOutlet weak var opt4: UIButton!
    
    private var questions = [questionBank]()
    private var selectedQuestion = 0
    private var score = 0
    private var selectedAnswer = answerSelect.placeholder
    //private var selectedAnswer: answerSelect
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = createQuestions()
        configure(with: questions[selectedQuestion])
    }
    
    private func configure(with questionSet: questionBank){
        questionTracker.text = "Question: \(questionSet.questionNumber)/\(questions.count)"
        questionCategory.text = questionSet.category
        currentQuestion.text = questionSet.questionPrompt
        opt1.setTitle(questionSet.option1, for: .normal)
        opt2.setTitle(questionSet.option2, for: .normal)
        opt3.setTitle(questionSet.option3, for: .normal)
        opt4.setTitle(questionSet.option4, for: .normal)
    }
    private func createQuestions() -> [questionBank]{
        let q1 = questionBank(questionNumber: 1, category: "Entertainment: Music", questionPrompt: "What is the last song on the first Panic! At The Disco album?", option1: "I Write Sins Not Tragedies", option2: "Lying Is The Most Fun A Girl Can Have Without Taking Her Clothes Off", option3: "Nails for Breakfast, Tacks for Snacks", option4: "Build God, Then We'll Talk", correctAnswer: .ans1)
        
        let q2 = questionBank(questionNumber: 2, category: "Entertainment: Video Games", questionPrompt: "What was the first weapon pack for 'PAYDAY'?", option1: "The Gage Weapon Pack #1", option2: "The Overkill Pack", option3: "The Gage Chivalry Pack", option4: "The Gage Historical Pack", correctAnswer: .ans2)
        
        let q3 = questionBank(questionNumber: 3, category: "History", questionPrompt: "Which of these founding fathers of the United States of America later became president?", option1: "Roger Sherman", option2: "James Monroe", option3: "Samuel Adams", option4: "Alexander Hamilton", correctAnswer: .ans3)
        
        return [q1,q2,q3]
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
