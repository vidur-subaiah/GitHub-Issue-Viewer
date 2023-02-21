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
        List (githubIssues.openIssues) { item in
            Text(item.title ?? "😢")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(githubIssues: GitHubIssues())
    }
}
