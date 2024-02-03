//
//  ListView.swift
//  NFCBusinessCard
//
//  Created by Shun Sato on 2024/02/02.
//

import SwiftUI

struct ListView: View {
    let items: [(name: String, url: String)] = [
        ("ほげ太郎さん", "https://example.com"),
        ("ほげ太郎さん", "https://example.com"),
        ("ほげ太郎さん", "https://example.com"),
        ("ほげ太郎さん", "https://example.com"),
        ("ほげ太郎さん", "https://example.com"),
        ("ほげ太郎さん", "https://example.com"),
        ("ほげ太郎さん", "https://example.com"),
        ("ほげ太郎さん", "https://example.com"),
        ("ほげ太郎さん", "https://example.com"),
        ("ほげ太郎さん", "https://example.com"),
        ("ほげ太郎さん", "https://example.com"),
        ("ほげ太郎さん", "https://example.com"),
    ]
    
    var body: some View {
        NavigationView {
            List(items, id: \.name) { item in
                HStack {
                    Text(item.name)
                    Spacer()
                    Text(item.url)
                        .foregroundColor(.gray)
                        .font(.caption)
                }
                .padding(.vertical, 4)
            }
            .navigationBarTitle("交換した人一覧", displayMode: .inline)
        }
    }
}


#Preview {
    ListView()
}
