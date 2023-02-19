import SwiftUI

struct NotificationList: View {
    @EnvironmentObject private var store: NotificationStore
    
    var body: some View {
        List(store.state.notifications) { notification in
            NavigationLink {
                // detail view
            } label: {
               NotificationRow(notification: notification)
            }
            .listRowBackground(notification.backgroundColor)
        }
        .refreshable {
            store.dispatch(.getNotifications)
        }
    }
}

private extension Notification {
    var backgroundColor: Color {
        readTime == nil ? .blue.opacity(0.1) : .white
    }
}

struct NotificationList_Previews: PreviewProvider {
    static var previews: some View {
        NotificationList()
            .environmentObject(NotificationStore.previewEnvironment)
    }
}
