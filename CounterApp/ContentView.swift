import SwiftUI

struct ContentView: View {
    @State private var count: Int = 0
    @State private var step: Int = 1

    var body: some View {
        VStack(spacing: 40) {
            Text("カウンター")
                .font(.largeTitle)
                .fontWeight(.bold)

            Text("\(count)")
                .font(.system(size: 100, weight: .thin, design: .rounded))
                .foregroundColor(count == 0 ? .primary : count > 0 ? .blue : .red)
                .animation(.spring(), value: count)

            HStack(spacing: 20) {
                Button(action: { count -= step }) {
                    Image(systemName: "minus.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.red)
                }

                Button(action: { count += step }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 60))
                        .foregroundColor(.blue)
                }
            }

            Divider()
                .padding(.horizontal, 40)

            VStack(spacing: 8) {
                Text("増減ステップ: \(step)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                HStack(spacing: 16) {
                    ForEach([1, 5, 10], id: \.self) { value in
                        Button("\(value)") {
                            step = value
                        }
                        .font(.headline)
                        .frame(width: 60, height: 36)
                        .background(step == value ? Color.accentColor : Color(.systemGray5))
                        .foregroundColor(step == value ? .white : .primary)
                        .cornerRadius(10)
                    }
                }
            }

            Button("リセット") {
                count = 0
            }
            .font(.headline)
            .foregroundColor(.white)
            .padding(.horizontal, 40)
            .padding(.vertical, 12)
            .background(Color.gray)
            .cornerRadius(12)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
