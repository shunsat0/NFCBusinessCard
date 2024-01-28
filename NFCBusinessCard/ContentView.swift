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
            
            //Text("\(NFCR.raw)")
            
            Spacer()
            
            HStack {
                Button(action: {
                    write()
                    NFCW.type = "U"
                    isFocused = false
                }, label: {
                    Text("書き込み")
                        .font(.system(size: 20,weight: .bold,design: .default))
                        .padding()
                })
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10.0)
                .padding()
                
                
                Button(action: {
                    read()
                    print(NFCR.msg)
                }, label: {
                    Text("読み込み")
                        .font(.system(size: 20,weight: .bold,design: .default))
                        .padding()
                })
                .foregroundColor(.accentColor)
                .background(.gray)
                .cornerRadius(10.0)
                .padding()
                
            }
            
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
