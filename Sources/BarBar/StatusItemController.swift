import AppKit
import SwiftUI

@MainActor
final class StatusItemController {
    private let statusItem: NSStatusItem
    private let menu: NSMenu

    init() {
        // Create status item in system menu bar
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        menu = NSMenu()

        setupIcon()
        setupMenu()
    }

    // MARK: - Icon Setup

    private func setupIcon() {
        guard let button = statusItem.button else { return }

        // Create a simple template icon (18x18 pt)
        let icon = makeIcon()
        button.image = icon
        button.imagePosition = .imageOnly
    }

    private func makeIcon() -> NSImage {
        let size = NSSize(width: 18, height: 18)
        let image = NSImage(size: size, flipped: false) { rect in
            // Draw a simple bar icon
            NSColor.black.setFill()

            // Top bar
            let topBar = NSRect(x: 2, y: 12, width: 14, height: 3)
            NSBezierPath(roundedRect: topBar, xRadius: 1.5, yRadius: 1.5).fill()

            // Bottom bar
            let bottomBar = NSRect(x: 2, y: 3, width: 14, height: 3)
            NSBezierPath(roundedRect: bottomBar, xRadius: 1.5, yRadius: 1.5).fill()

            return true
        }
        image.isTemplate = true  // Adapts to menu bar appearance
        return image
    }

    // MARK: - Menu Setup

    private func setupMenu() {
        statusItem.menu = menu

        // Header item with SwiftUI view
        let headerItem = NSMenuItem()
        let headerView = NSHostingView(rootView: MenuHeaderView())
        headerView.frame = NSRect(x: 0, y: 0, width: 220, height: 60)
        headerItem.view = headerView
        menu.addItem(headerItem)

        menu.addItem(.separator())

        // Action items
        menu.addItem(NSMenuItem(title: "Refresh", action: #selector(refresh), keyEquivalent: "r"))
        menu.addItem(NSMenuItem(title: "Open Dashboard", action: #selector(openDashboard), keyEquivalent: "d"))

        menu.addItem(.separator())

        // Settings & Quit
        let settingsItem = NSMenuItem(title: "Settings...", action: #selector(openSettings), keyEquivalent: ",")
        menu.addItem(settingsItem)

        let quitItem = NSMenuItem(title: "Quit", action: #selector(quit), keyEquivalent: "q")
        menu.addItem(quitItem)

        // Set targets for menu actions
        for item in menu.items {
            item.target = self
        }
    }

    // MARK: - Menu Actions

    @objc private func refresh() {
        print("Refreshing...")
        // Add your refresh logic here
    }

    @objc private func openDashboard() {
        if let url = URL(string: "https://example.com/dashboard") {
            NSWorkspace.shared.open(url)
        }
    }

    @objc private func openSettings() {
        NSApp.sendAction(Selector(("showSettingsWindow:")), to: nil, from: nil)
        NSApp.activate(ignoringOtherApps: true)
    }

    @objc private func quit() {
        NSApp.terminate(nil)
    }
}
