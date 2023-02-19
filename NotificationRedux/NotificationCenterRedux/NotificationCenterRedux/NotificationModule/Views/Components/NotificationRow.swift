import SwiftUI

struct NotificationRow: View {
    let notification: Notification
    
    var body: some View {
        HStack(alignment: .top) {
            icon
            copy
            Spacer()
            time
        }
        .padding(.vertical)
    }
}

private extension NotificationRow {
    var icon: some View {
        Circle()
            .fill(.blue.opacity(0.2))
            .overlay(
                Image(systemName: notification.iconName)
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.blue)
                    .frame(width: 16, height: 16)
            )
            .frame(width: 32, height: 32)
    }
    
    var copy: some View {
        VStack(alignment: .leading) {
            Text(notification.title)
                .font(.headline)
            Text(notification.description)
                .font(.caption)
        }
    }
    
    var time: some View {
        Text(notification.creationTime.formatted(date: .omitted, time: .shortened))
            .font(.footnote)
            .bold()
    }
}
