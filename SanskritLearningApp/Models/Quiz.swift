import Foundation


enum QuizMode {
    case basic
    case medium
    case advanced
    case all
}

struct Quiz {
    private(set) var currentQuestionIndex = 0
    private(set) var guesses = [String: Int]()
    private(set) var isOver = false
    private(set) var isDismissed = false
    private var questions: [Question] = []
    private(set) var correct: Int = 0
    private(set) var incorrect: Int = 0
    
    private var mode: QuizMode
    private var questionCount: Int
    
    var numberOfQuestions: Int {
        questions.count
    }
    
    // get the current question
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    init(mode: QuizMode = .advanced, questionCount: Int = 10) {
        self.mode = mode
        self.questionCount = questionCount
        var newQuestions = loadAllQuestions()
        
        // if basic, include things with 'basic' in the keywords
        if mode == .basic {
            newQuestions = newQuestions.filter { $0.keywords.contains("basic") }
        } else if mode == .medium {
            newQuestions = newQuestions.filter { $0.keywords.contains("medium") }
        } else if mode == .advanced {
            newQuestions = newQuestions.filter { $0.keywords.contains("advanced") }
        }
        
        //  shuffle
        newQuestions.shuffle()
        
        self.questions = Array(newQuestions.prefix(questionCount))
        print("Init new quiz with \(questions.count) questions")
        questions.forEach { print("• \($0.prompt)") }
    }
    
    // make a guess
    mutating func makeGuessForCurrentQuestion(atIndex index: Int) -> Bool {
        guesses[currentQuestion.id] = index
        var isCorrect: Bool = false
        
        // if this is correct, add this to data
        if currentQuestion.possibleAnswers[index] == currentQuestion.answer {
            correct += 1
            isCorrect = true
        } else {
            incorrect += 1
            isCorrect = false
        }
        
        return isCorrect
    }
    
    mutating func updateQuizStatus() {
        print("Updating quiz status")
        if currentQuestionIndex < (questions.count - 1) {
            currentQuestionIndex += 1
            print("Current question index: \(currentQuestionIndex)")
        } else {
            print("GAME OVER MAN")
            isOver = true
        }
    }
    mutating func dismiss() {
        print("Dismissing quiz")
        isDismissed = true
    }
    
    // Todo - maybe move this elsewhere?
    func loadAllQuestions() -> [Question] {
        return JSONLoader.load(from: "questions", as: [Question].self)
    }
    

}
