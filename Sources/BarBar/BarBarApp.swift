import SwiftUI

@main
struct BarBarApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        Settings {
            SettingsView()
        }
    }
}

@MainActor
final class AppDelegate: NSObject, NSApplicationDelegate {
    private var statusItemController: StatusItemController?

    func applicationDidFinishLaunching(_ notification: Notification) {
        // Hide dock icon - makes this a menu bar only app
        NSApp.setActivationPolicy(.accessory)

        statusItemController = StatusItemController()
    }
}
