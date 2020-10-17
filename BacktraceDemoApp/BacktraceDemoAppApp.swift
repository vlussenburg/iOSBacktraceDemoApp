//
//  BacktraceDemoAppApp.swift
//  BacktraceDemoApp
//
//  Created by Vincent on 10/16/20.
//

import SwiftUI
import Backtrace
import Backtrace_PLCrashReporter

@main
struct BacktraceDemoAppApp: App {
    
    init() {
        let backtraceCredentials = BacktraceCredentials(endpoint: URL(string: "https://cd03.sp.backtrace.io:6098")!, token: "03741e036b52cede4dd9824eaac00d69fc58b857d506d6389fa9774924223c87")
        
        BacktraceClient.shared = try? BacktraceClient(credentials: backtraceCredentials, crashReporter: BacktraceCrashReporter(config: PLCrashReporterConfig.defaultConfiguration()))
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
