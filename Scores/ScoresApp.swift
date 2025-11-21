//
//  ScoresApp.swift
//  Scores
//
//  Created by Patricia M Espert on 12/11/25.
//

import SwiftUI

@main
struct ScoresApp: App {
    @StateObject private var vm = ScoresVM()

    var body: some Scene {
        WindowGroup {
            ScoresListView()
                .environmentObject(vm)
                .onAppear {
                    print(URL.documentsDirectory)
                }
        }
    }
}
