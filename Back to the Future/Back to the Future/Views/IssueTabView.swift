//
//  IssueTabView.swift
//  Back to the Future
//
//  Created by Vidur Subaiah on 2/21/23.
//

import SwiftUI

struct IssueTabView: View {
    var state: String
    @ObservedObject var githubIssues: GitHubIssues
    
    var body: some View {
        if (state == "open"){
            NavigationView {
                List (githubIssues.openIssues) { item in
                    NavigationLink(destination: IssueDetail(issue: item)) {
                        Image(systemName: "tray.full.fill")
                            .resizable()
                            .frame(width:30, height:30)
                            .padding(.trailing, 10)
                        VStack(alignment: .leading) {
                            Text(item.title ?? "😢")
                                .fontWeight(.bold)
                                .lineLimit(2)
                            Text("@" + item.user.login)
                                
                        }
                    }
                    .navigationBarTitle("Open Issues", displayMode: .large)
                    .toolbarBackground(Color.red, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                    
                    // Attribution: https://sarunw.com/posts/swiftui-navigation-bar-color/
                }
            }
            
        }
        else {
            NavigationView {
                List (githubIssues.closedIssues) { item in
                    NavigationLink(destination: IssueDetail(issue: item)) {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width:30, height:30)
                            .padding(.trailing, 10)
                        VStack(alignment: .leading) {
                            Text(item.title ?? "😢")
                                .fontWeight(.bold)
                                .lineLimit(2)
                            Text("@" + item.user.login)
                                
                        }
                    }
                    .navigationBarTitle("Closed Issues", displayMode: .large)
                    .toolbarBackground(Color.green, for: .navigationBar)
                    .toolbarBackground(.visible, for: .navigationBar)
                }
            }
        }
    }
}

struct IssueTabView_Previews: PreviewProvider {
    static var previews: some View {
        IssueTabView(state: "open", githubIssues: GitHubIssues())
    }
}
