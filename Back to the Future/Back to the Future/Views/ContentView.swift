//
//  ContentView.swift
//  Back to the Future
//
//  Created by Vidur Subaiah on 2/21/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var githubIssues: GitHubIssues
    
    // You need to run in simulator or do a Live Preview
    // for the data to load
    var body: some View {
        
        TabView(selection: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Selection@*/.constant(1)/*@END_MENU_TOKEN@*/) {
            
            IssueTabView(state: "open", githubIssues: githubIssues)
            .tabItem { Label("Open", systemImage: "tray.full.fill") }.tag(1)
            
            IssueTabView(state: "closed", githubIssues: githubIssues)
            .tabItem { Label("Closed", systemImage: "checkmark.circle.fill")  }.tag(2)

        }
        .accentColor(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(githubIssues: GitHubIssues())
    }
}
