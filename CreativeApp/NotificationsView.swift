//
//  NotificationsView.swift
//  MuseMe
//
//  Created by Angelo Brown on 4/29/24.
//

import SwiftUI

struct NotificationsView: View {
    @AppStorage("receiveEmails") private var receiveEmails: Bool = false
    @AppStorage("receivePushNotifications") private var receivePushNotifications: Bool = true
    @AppStorage("receiveMonthlyNewsletter") private var receiveMonthlyNewsletter: Bool = false
    @AppStorage("receiveEventReminders") private var receiveEventReminders: Bool = true
    @AppStorage("receiveSpecialOffers") private var receiveSpecialOffers: Bool = false

    var body: some View {
        Form {
            Section(header: Text("Notification Settings")) {
                Toggle("Email Notifications", isOn: $receiveEmails)
                Toggle("Push Notifications", isOn: $receivePushNotifications)
                Toggle("Monthly Newsletter", isOn: $receiveMonthlyNewsletter)
            }
            
            Section(header: Text("Notification Preferences")) {
                Toggle("Event Reminders", isOn: $receiveEventReminders)
                Toggle("Special Offers", isOn: $receiveSpecialOffers)
            }
        }
        .navigationTitle("Notifications")
        .onAppear {
            // Optionally call to load settings from a backend or check system notification settings
            loadNotificationSettings()
        }
    }

    private func loadNotificationSettings() {
        // Here, you might load user's settings from a backend or check system settings
        print("Load existing notification settings from storage or backend")
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NotificationsView()
        }
    }
}
