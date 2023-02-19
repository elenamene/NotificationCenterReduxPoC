import SwiftUI

struct ErrorView: View {
    @EnvironmentObject private var store: NotificationStore // pass only SelectionStore
    
    var body: some View {
        VStack(spacing: 32) {
            Text("Something went wrong")
            Image(systemName: "xmark.shield")
                .foregroundColor(.gray.opacity(0.3))
                .fontWeight(.bold)
                .font(.system(size: 120))
            Button("Try again") {
                store.dispatch(.getNotifications)
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
