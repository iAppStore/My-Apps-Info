//
//  DashboardModel.swift
//  iAppStore
//
//  Created by mohammad mugish on 28/01/22.
//

import Foundation
import SwiftUI

struct DashboardModel: Identifiable {
    
    let id = UUID()
    var screenShots = [String]()
    var userName: String = ""
    var appName: String = ""
    var discription: String = ""
    var githubLink: URL?
    var twitter: URL?
    var linkedIn: URL?
    var resume: URL?
    var view : AnyView = AnyView(EmptyView())
    
    
    internal init(screenShots: [String] = [String](), userName: String, appName: String, discription: String, githubLink: URL? = nil, twitter: URL? = nil, linkedIn: URL? = nil, resume: URL? = nil, view: AnyView) {
        self.screenShots = screenShots
        self.userName = userName
        self.appName = appName
        self.discription = discription
        self.githubLink = githubLink
        self.twitter = twitter
        self.linkedIn = linkedIn
        self.resume = resume
        self.view = view
    }
    
    init() { }
}
