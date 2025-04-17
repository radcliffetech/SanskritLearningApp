import SwiftUI

enum ChoiceButtonStyle {
    case normal
    case correct
    case incorrect
    case disabled
    case missed
}

struct ChoiceButton: View {
    let answer: String
    let style: ChoiceButtonStyle
    let action: () -> Void

    @State private var isPressed = false

    var body: some View {
        let (foregroundColor, backgroundColor, borderColor, isDisabled, opacity) = styleAttributes(for: style)

        Button(action: {
            withAnimation(.spring(response: 0.2, dampingFraction: 0.5)) {
                isPressed = true
            }
            action()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                isPressed = false
            }
        }) {
            Text(answer)
                .font(.system(size: 20, weight: .semibold, design: .rounded))
                .foregroundColor(foregroundColor)
                .multilineTextAlignment(.center)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
                .frame(maxWidth: .infinity, alignment: .center)
                .padding()
                .background(backgroundColor)
                .scaleEffect(isPressed ? 0.95 : 1.0)
                .opacity(opacity)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(borderColor, lineWidth: 2)
        )
        .shadow(color: .black.opacity(0.1), radius: 2, x: 0, y: 2)
        .disabled(isDisabled)
    }

    private func styleAttributes(for style: ChoiceButtonStyle) -> (Color, Color, Color, Bool, Double) {
        switch style {
        case .normal:
            return (.blue, Color.clear, .blue, false, 1.0)
        case .correct:
            return (.green, .green.opacity(0.2), .green, true, 1.0)
        case .incorrect:
            return (.red, .red.opacity(0.2), .red, true, 1.0)
        case .disabled:
            return (.gray, Color.clear, .gray, true, 0.5)
        case .missed:
            return (.orange, .orange.opacity(0.2), .orange, true, 1.0)
        }
    }
}

#Preview("Normal") {
    ChoiceButton(answer: "सूर्यः", style: .normal, action: {})
}

#Preview("Correct") {
    ChoiceButton(answer: "चन्द्रः", style: .correct, action: {})
}

#Preview("Incorrect") {
    ChoiceButton(answer: "नदी", style: .incorrect, action: {})
}

#Preview("Disabled") {
    ChoiceButton(answer: "पर्वतः", style: .disabled, action: {})
}

#Preview("Missed") {
    ChoiceButton(answer: "पर्वतः", style: .missed, action: {})
}
