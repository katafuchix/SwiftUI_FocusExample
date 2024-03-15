//
//  FocusStateDemoCommentView.swift
//  SwiftUI_FocusExample
//
//  Created by cano on 2024/03/15.
//

import SwiftUI

struct CommentPreview: View {
    @FocusedValue(\.commentFocusedValue) var comment
 
    var body: some View {
        VStack {
            Text(comment ?? "Not focused")
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 100)
        .padding()
        .background(.yellow)
    }
}

struct CommentFocusedKey: FocusedValueKey {
    typealias Value = String
}

extension FocusedValues {
    var commentFocusedValue: CommentFocusedKey.Value? {
        get { self[CommentFocusedKey.self] }
        set { self[CommentFocusedKey.self] = newValue }
    }
}

struct FocusStateDemoCommentView: View {
    enum Field: Hashable {
        case name
        case email
        case comment
    }
 
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var comment: String = ""
 
    @FocusState private var selectedField: Field?
 
    var body: some View {
        VStack {
            Text("👋Help us improve")
                .font(.system(.largeTitle, design: .rounded, weight: .black))
 
            TextField("Name", text: $name)
                .padding()
                .border(.gray, width: 1)
                .focused($selectedField, equals: .name)
 
            TextField("Email", text: $email)
                .padding()
                .border(.gray, width: 1)
                .focused($selectedField, equals: .email)
 
            TextField("Any comment?", text: $comment)
                .padding()
                .border(.gray, width: 1)
                .focused($selectedField, equals: .comment)
                .focusedValue(\.commentFocusedValue, comment)
 
            Button("Submit") {
                selectedField = nil
            }
            .controlSize(.extraLarge)
            .buttonStyle(.borderedProminent)
 
            Spacer()
 
            CommentPreview()
            
        }
        .padding()
        .onChange(of: selectedField) { oldValue, newValue in
            print(newValue ?? "No field is selected")
        }
    }
}

#Preview {
    FocusStateDemoCommentView()
}
