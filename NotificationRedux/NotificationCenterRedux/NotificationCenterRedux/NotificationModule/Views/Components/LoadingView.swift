import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView("Loading")
            .frame(width: 160, height: 160)
            .background(.gray.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}
