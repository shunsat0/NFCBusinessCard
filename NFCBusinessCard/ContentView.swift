//
//  ContentView.swift
//  NFCBusinessCard
//
//  Created by Shun Sato on 2024/01/28.
//

import SwiftUI
import SwiftNFC

struct ContentView: View {
    @State var inputUrl:String = ""
    @State var readedUrl:String = ""
    @FocusState var isFocused: Bool
    @ObservedObject var NFCR = NFCReader()
    @ObservedObject var NFCW = NFCWriter()
    
    
    func read() {
        NFCR.read()
        readedUrl = NFCR.raw
        print(readedUrl)
    }
    
    
    
    func write() {
        NFCW.msg = inputUrl
        NFCW.write()
    }
    
    var body: some View {
        NavigationView {
            VStack {
                
                Text("\(readedUrl)")
                
                Spacer()
                TextField("URLを入力してください", text: $inputUrl, axis: .vertical)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .focused($isFocused)
                    .keyboardType(.URL)
                
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
                    }, label: {
                        Text("読み込み")
                            .font(.system(size: 20,weight: .bold,design: .default))
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.accentColor, lineWidth: 3)
                            )
                    })
                    .foregroundColor(.accentColor)
                    .background(.white)
                    .padding()
                }
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: ListView()) {
                        Text("交換した人一覧")
                    }
                }
            }
            .padding()
        }
        
    }
}

#Preview {
    ContentView()
}
