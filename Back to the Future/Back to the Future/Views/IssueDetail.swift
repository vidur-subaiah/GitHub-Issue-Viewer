//
//  IssueDetail.swift
//  Back to the Future
//
//  Created by Vidur Subaiah on 2/21/23.
//

import SwiftUI

struct IssueDetail: View {
    var issue: GitHubIssue
    
    var body: some View {
        
        ScrollView {
            VStack {
                if (issue.state == "open"){
                    Image(systemName: "tray.full.fill")
                        .resizable()
                        .frame(width: 60, height:60)
                        .padding(.top, 50)
                }
                else {
                    Image(systemName: "checkmark.circle.fill")
                        .resizable()
                        .frame(width: 60, height:60)
                        .padding(.top, 50)
                }
                Text(issue.title!)
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding(10)
                HStack {
                    // Attribution: https://developer.apple.com/documentation/swiftui/asyncimage
                    // Attribution: https://developer.apple.com/tutorials/swiftui/creating-and-combining-views
                    // Attribution: https://stackoverflow.com/questions/71297678/how-to-shape-an-image-into-an-circle
                    AsyncImage(url: URL(string: issue.user.avatarUrl!)) { image in
                        image.resizable().scaledToFill().clipShape(Circle()).frame(width: 60, height: 60).overlay(Circle().stroke(.black)).padding(10)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    Text("@" + issue.user.login)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }
                
                HStack {
                    Text("Date: ")
                        .padding(10)
                    
                    if let formattedDate = formatDate(date: issue.createdAt!){
                        Text(formattedDate)
                    }
                    else {
                        Text(issue.createdAt!)
                    }
                    
                    Spacer()
                }
                .font(.title)
                .fontWeight(.bold)
                
               Text("Description")
                    .font(.title)
                    .padding(10)
                    .fontWeight(.bold)
                    .underline()
                
                Text(issue.body!)
                    .padding(10)
                
                Spacer()
            }
        }
    }

}

struct IssueDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        let exampleIssue = GitHubIssue(title: "Example Issue", id: 1, createdAt: "2020-01-01T18:46:19-0700", body: "This is an example issue that was opened at the start of the year", state: "open", user: GitHubUser(login: "james_123", avatarUrl: "https://github.com/vidur-subaiah.png"))
        
        IssueDetail(issue: exampleIssue)
    }
}
