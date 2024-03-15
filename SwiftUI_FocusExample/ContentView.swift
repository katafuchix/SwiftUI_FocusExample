//
//  ContentView.swift
//  SwiftUI_FocusExample
//
//  Created by cano on 2024/03/15.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("@FocusState Example", destination: FocusStateDemoView())
                
                NavigationLink("Multiple TextField Example", destination: FocusStateDemoEnumView())
                
                NavigationLink("FocusedValues Example", destination: FocusStateDemoCommentView())
                
                NavigationLink("FocusedValues ViewModel Example", destination: FocusStateDemoView_ViewModel())
            }
        }
    }
}

#Preview {
    ContentView()
}
