//
//  ContentView.swift
//  NFCBusinessCard
//
//  Created by Shun Sato on 2024/01/28.
//

import SwiftUI

struct ContentView: View {
    @State var inputUrl = "https://example.com/"
    @FocusState var isFocused: Bool
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                TextField("URLを入力してください", text: $inputUrl)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .focused($isFocused)
                    .keyboardType(.URL)
                    .onSubmit {
                        // returnされた時の処理
                        print("\(inputUrl)")
                    }
                
                Spacer()
                
                Button(action: {
                    isFocused = false
                }, label: {
                    Text("NFCカードに登録")
                        .font(.system(size: 20,weight: .bold,design: .default))

                        .padding()
                })
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10.0)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
