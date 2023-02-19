//
//  ContentView.swift
//  NotificationCenterRedux
//
//  Created by Elena Meneghini on 17/2/23.
//

import SwiftUI

struct NotificationCenterView: View {
    @EnvironmentObject private var store: NotificationStore
    
    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                switch store.state.loadingState {
                case .error:
                    ErrorView()
                case .loaded:
                    NotificationList()
                case .loading, .idle:
                    LoadingView()
                }
            }
            .navigationTitle("Notifications")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Mark all as read") {
                        store.dispatch(.markAllNotificationsAsRead)
                    }
                }
            }
        }
        .onAppear {
            store.dispatch(.getNotifications)
        }
    }
}
