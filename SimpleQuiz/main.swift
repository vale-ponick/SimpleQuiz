//
//  main.swift
//  SimpleQuiz
//
//  Created by Валерия Пономарева on 17.05.2026.
//

import Foundation

print("SimpleQuiz: ✅ Программа задаёт вопрос, user даёт ответ. Если ответ правильный — переходит к следующему вопросу. В конце показывает, сколько правильных ответов")
  
enum Command: String {
    case start = "start"
    case help = "help"
    case exit = "exit"
    
}
 let capitals = [
    "France": "Paris",
    "Great Britain": "London",
    "China": "Beijing",
    "Spain": "Madrid",
    "Chile": "Santiago",
    "Germany": "Berlin",
    "Italy": "Rome",
    "USA": "Washington, D.C.",
    "Canada": "Ottawa"
]

func startQuiz() {
    print("Quiz started")
    
    var score = 0
    var queastions = Array(capitals) // словарь → массив кортежей
    queastions.shuffle() //    // случайный порядок
    
    quizLoop: for (country, capital) in queastions { // inner circle!
        
        print("> Capital of \(country)? ", terminator: "") // задаем вопрос
        let input = readLine()? // получаем ответ
            .trimmingCharacters(in: .whitespaces) ?? ""
        
        if input.lowercased() == "stop" {
            print("Quiz stopped")
            break quizLoop // ← выход из цикла с меткой!
        }

        
            if input.lowercased() == capital.lowercased() {
                print("✅ Correct!")
                score += 1
            } else {
                print("❌ Wrong. Correct answer: \(capital)")
            }
        }
        print("🏆 Your score: \(score) out of \(capitals.count)")
}
    
    while true {
    print("\n> ", terminator: "") // приглашение в одной строке с вводом
    guard let input = readLine()?
        .trimmingCharacters(in: .whitespaces),
          !input.isEmpty else { // защита от nil и пустого ввода
        continue // при ошибке цикл повторяется, программа не падает
    }
        
    guard let command = Command(rawValue: input) else { // разворачивает опционал, полученный из Command(rawValue: input)
         print("Uncnown command") // Если команда неизвестна — ошибка и continue
        continue
        }
        switch command {
        case .start:
            startQuiz()
        case .help:
            print("""
                 Commands:
                      start - start the quiz
                      help  - show this help
                      exit  - exit the program
                """)
        case .exit:
            print("By, bro!")
            break
    }
}
    

