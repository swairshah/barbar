import SwiftUI

struct MenuHeaderView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "menubar.rectangle")
                    .font(.title2)
                Text("BarBar")
                    .font(.headline)
                Spacer()
            }

            HStack {
                Text("Status:")
                    .foregroundStyle(.secondary)
                Text("Active")
                    .foregroundStyle(.green)
                Spacer()
            }
            .font(.caption)
        }
        .padding(12)
        .frame(width: 220)
    }
}

#Preview {
    MenuHeaderView()
}
