import Foundation


struct Question: Hashable, Identifiable, Codable {
    var id: String = "\(UUID())" // new line
    let prompt: String
    let possibleAnswers: [String]
    let answer: String
    var keywords: [String] = []

    static func ==(lhs: Question, rhs: Question) -> Bool {
        return lhs.prompt == rhs.prompt && lhs.answer == rhs.answer
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(prompt)
        hasher.combine(answer)
    }
    
    static var testQuestions = [
        Question(prompt: "What is the meaning of 'शिक्षकः'?", possibleAnswers: ["student", "teacher", "parent", "child"], answer: "teacher"),
        Question(prompt: "What is the Sanskrit word for 'friend'?", possibleAnswers: ["मित्रम्", "दुर्हितः", "राजा", "शत्रुः"], answer: "मित्रम्"),
        Question(prompt: "What is the meaning of 'शत्रुः'?", possibleAnswers: ["friend", "enemy", "guest", "student"], answer: "enemy"),
        Question(prompt: "What is the Sanskrit word for 'book'?", possibleAnswers: ["पुस्तकम्", "पत्रम्", "लेखनम्", "विद्या"], answer: "पुस्तकम्"),
        Question(prompt: "What is the meaning of 'वायु'?", possibleAnswers: ["earth", "air", "fire", "water"], answer: "air"),
        Question(prompt: "What is the Sanskrit word for 'forest'?", possibleAnswers: ["वनम्", "वृक्षः", "गिरिः", "ग्रामः"], answer: "वनम्")
    ]
}
