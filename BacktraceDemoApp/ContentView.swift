//
//  ContentView.swift
//  BacktraceDemoApp
//
//  Created by Vincent on 10/16/20.
//

import SwiftUI
import Backtrace

enum MyError: Error {
    case runtimeError(String)
}

struct ContentView: View {
    @State var message: String = ""
    
    var body: some View {
        Text("BacktraceDemoApp!")
            .padding()
        
        Text(message)
            .padding()
        
        Text("Tap me to crash!")
            .padding()
        
        Button {
            fatalError()
        } label: {
            Text("Crash")
        }

        Text("Tap me to throw, catch and report an error!")
            .padding()
        
        Button {
            message = "sending error..."
            do {
                try someFunction()
            } catch {
                BacktraceClient.shared?.send(error: error, attachmentPaths: [], completion: { (result) in
                    print(result)
                    message = "error sent"
                })
            }
        } label: {
            Text("Caught error")
        }
    }
    
    func someFunction() throws {
        throw MyError.runtimeError("some message")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
