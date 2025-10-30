//
//  TriviaService.swift
//  Trivia
//
//  Created by Fiyinfoluwa Afolayan on 10/9/23.
//

import Foundation

class TriviaService{
    static func fetchQuestions(completion: (([TriviaQuestion]) -> Void)? = nil){
        let url = URL(string: "https://opentdb.com/api.php?amount=5")!
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            // this closure is fired when the response is received
            guard error == nil else {
                assertionFailure("Error: \(error!.localizedDescription)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                assertionFailure("Invalid response")
                return
            }
            guard let data = data, httpResponse.statusCode == 200 else {
                assertionFailure("Invalid response status code: \(httpResponse.statusCode)")
                return
            }
            let decoder = JSONDecoder()
            let response = try! decoder.decode(TriviaAPIResponse.self, from: data)
            DispatchQueue.main.async {
                    completion?(response.results)
                  }
//            let question = parse(data: data)
//            DispatchQueue.main.async {
//                    completion?(question) // call the completion closure and pass in the forecast data model
//                  }
        }
        task.resume()
    }
    private static func parse(data: Data) -> TriviaQuestion {
        // transform the data we received into a dictionary [String: Any]
        let jsonDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        let currentTrivQuestion = jsonDictionary["results"] as! [String: Any]
        // wind speed
        let category = currentTrivQuestion["category"] as! String
        // wind direction
        let question = currentTrivQuestion["question"] as! String
        // temperature
        let correctAnswer = currentTrivQuestion["correct_answer"] as! String
        let incorrectAnswers = currentTrivQuestion["incorrect_answers"] as! [String]
        return TriviaQuestion(category: category, question: question, correctAnswer: correctAnswer, incorrectAnswers: incorrectAnswers)
      }
}
