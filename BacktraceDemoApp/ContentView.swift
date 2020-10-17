//
//  ContentView.swift
//  BacktraceDemoApp
//
//  Created by Vincent on 10/16/20.
//

import SwiftUI
import Backtrace

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

        Text("Tap me to throw an error!")
            .padding()
        
        Button {
            message = "sending error..."
            let e = NSError(domain: "x", code: 1, userInfo: nil)
            BacktraceClient.shared?.send(error: e, attachmentPaths: [], completion: { (result) in
                print(result)
                message = "error sent"
            })
        } label: {
            Text("Error")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
