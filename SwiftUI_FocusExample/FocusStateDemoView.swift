//
//  FocusStateDemoView.swift
//  SwiftUI_FocusExample
//
//  Created by cano on 2024/03/15.
//

import SwiftUI

struct FocusStateDemoView: View {
       @State private var comment: String = ""
    
       @FocusState private var isCommentFocused: Bool
    
       var body: some View {
           VStack {
               Text("👋Help us improve")
                   .font(.system(.largeTitle, design: .rounded, weight: .black))
    
               TextField("Any comment?", text: $comment)
                   .padding()
                   .border(.gray, width: 1)
                   .focused($isCommentFocused)
    
               Button("Submit") {
                   isCommentFocused = false
               }
               .controlSize(.extraLarge)
               .buttonStyle(.borderedProminent)
    
           }
           .padding()
           .onChange(of: isCommentFocused) { oldValue, newValue in
               print(newValue ? "Focused" : "Not focused")
           }
       }
}

#Preview {
    FocusStateDemoView()
}
