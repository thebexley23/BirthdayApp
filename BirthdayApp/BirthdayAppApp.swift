//
//  BirthdayAppApp.swift
//  BirthdayApp
//
//  Created by Scholar on 7/11/25.
//

import SwiftUI
import SwiftData

@main
struct BirthdayAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Friend.self)
            //this line of code
        }
    }
}
