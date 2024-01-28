//
//  ContentView.swift
//  NFCBusinessCard
//
//  Created by Shun Sato on 2024/01/28.
//

import SwiftUI
import SwiftNFC

struct ContentView: View {
    @State var inputUrl = ""
    @FocusState var isFocused: Bool
    @ObservedObject var NFCR = NFCReader()
    @ObservedObject var NFCW = NFCWriter()
    
    func read() {
        NFCR.read()
    }
    
    func write() {
        NFCW.msg = inputUrl
        NFCW.write()
    }
    
    var body: some View {
        VStack {
            Spacer()
            TextField("URLを入力してください", text: $inputUrl, axis: .vertical)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .focused($isFocused)
                .keyboardType(.URL)
                .onSubmit {
                    // returnされた時の処理
                    print("\(inputUrl)")
                }
            
            Spacer()
            
            Button(action: {
                write()
                NFCW.type = "U"
            }, label: {
                Text("書き込み")
                    .font(.system(size: 20,weight: .bold,design: .default))
                    .padding()
            })
            .foregroundColor(.white)
            .background(.green)
            .cornerRadius(10.0)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
