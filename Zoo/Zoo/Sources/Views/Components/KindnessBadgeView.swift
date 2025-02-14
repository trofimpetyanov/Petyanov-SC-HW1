import SwiftUI

struct KindnessBadgeView: View {
    let level: Int
    
    var body: some View {
        Text("\(level)")
            .font(.caption.monospacedDigit().bold())
            .padding(.vertical, 4)
            .padding(.horizontal, 8)
            .background(Color.green)
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
} 

#Preview {
    List {
        HStack {
            Text("Обезьяна")
            KindnessBadgeView(level: 4)
        }
    }
}

