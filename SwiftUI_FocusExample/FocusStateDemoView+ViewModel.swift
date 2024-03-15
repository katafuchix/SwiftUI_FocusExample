//
//  FocusStateDemoView+ViewModel.swift
//  SwiftUI_FocusExample
//
//  Created by cano on 2024/03/15.
//

import SwiftUI

class FormViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var comment: String = ""
}

struct CommentPreview_ViewModel: View {
 
    @FocusedObject var viewModel: FormViewModel?
 
    var body: some View {
        VStack {
            Text(viewModel?.name ?? "Not focused")
            Text(viewModel?.email ?? "Not focused")
            Text(viewModel?.comment ?? "Not focused")
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 100)
        .padding()
        .background(.yellow)
    }
}

struct FocusStateDemoView_ViewModel: View {
    enum Field: Hashable {
        case name
        case email
        case comment
    }
 
    @FocusState private var selectedField: Field?
 
    @StateObject private var viewModel: FormViewModel = FormViewModel()
    
    var body: some View {
        VStack {
            Text("👋Help us improve")
                .font(.system(.largeTitle, design: .rounded, weight: .black))
 
            TextField("Name", text: $viewModel.name)
                .padding()
                .border(.gray, width: 1)
                .focused($selectedField, equals: .name)
                .focusedObject(viewModel)
 
            TextField("Email", text: $viewModel.email)
                .padding()
                .border(.gray, width: 1)
                .focused($selectedField, equals: .email)
                .focusedObject(viewModel)
 
            TextField("Any comment?", text: $viewModel.comment)
                .padding()
                .border(.gray, width: 1)
                .focused($selectedField, equals: .comment)
                //.focusedValue(\.commentFocusedValue, comment)
                .focusedObject(viewModel)
 
            Button("Submit") {
                selectedField = nil
            }
            .controlSize(.extraLarge)
            .buttonStyle(.borderedProminent)
 
            Spacer()
 
            CommentPreview_ViewModel()
            
        }
        .padding()
        .onChange(of: selectedField) { oldValue, newValue in
            print(newValue ?? "No field is selected")
        }
    }
}

#Preview {
    FocusStateDemoView_ViewModel()
}
