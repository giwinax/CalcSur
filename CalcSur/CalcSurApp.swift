//
//  CalcSurApp.swift
//  CalcSur
//
//  Created by s b on 16.11.2020.
//

import SwiftUI

@main
struct MenuBarPopoverApp: App {
    @NSApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        Settings{
            SettingsView()
        }
    }
}
class AppDelegate: NSObject, NSApplicationDelegate {
    var popover = NSPopover.init()
    var statusBarItem: NSStatusItem?

    func applicationDidFinishLaunching(_ notification: Notification) {
        
        let contentView = ContentView()

        // Set the SwiftUI's ContentView to the Popover's ContentViewController
        popover.behavior = .transient // !!! - This does not seem to work in SwiftUI2.0 or macOS BigSur yet
        popover.animates = false
        popover.contentViewController = NSViewController()
        popover.contentViewController?.view = NSHostingView(rootView: contentView)
        statusBarItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        //statusBarItem?.button?.title = ""
        statusBarItem?.button?.image = NSImage(systemSymbolName: "x.squareroot", accessibilityDescription: "") //Image(systemName: "x.squareroot")
        statusBarItem?.button?.action = #selector(AppDelegate.togglePopover(_:))
    }
    @objc func showPopover(_ sender: AnyObject?) {
        if let button = statusBarItem?.button {
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
//            !!! - displays the popover window with an offset in x in macOS BigSur.
        }
    }
    @objc func closePopover(_ sender: AnyObject?) {
        popover.performClose(sender)
    }
    @objc func togglePopover(_ sender: AnyObject?) {
        if popover.isShown {
            closePopover(sender)
        } else {
            showPopover(sender)
        }
    }
}
