//
//  NotificationCenterReduxApp.swift
//  NotificationCenterRedux
//
//  Created by Elena Meneghini on 17/2/23.
//

import SwiftUI

@main
struct NotificationCenterReduxApp: App {
    @StateObject private var store = NotificationStore(
        state: NotificationCenterState(),
        reducer: notificationCenterReducer,
        middlewares: [
            // TODO: These will come from Dependency container
            getNotificationsUseCase(repo: NotificationRepository()),
            markNotificationsAsReadUseCase(repo: NotificationRepository()),
            trackingMiddleware(tracker: Tracker())
        ]
    )
    
    var body: some Scene {
        WindowGroup {
            NotificationCenterView()
                .environmentObject(store)
        }
    }
}
