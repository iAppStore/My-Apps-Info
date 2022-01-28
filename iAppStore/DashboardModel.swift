//
//  DashboardModel.swift
//  iAppStore
//
//  Created by mohammad mugish on 28/01/22.
//

import Foundation

struct DashboardModel: Identifiable {
    let id = UUID()
    var screenShots = [String]()
    var userName: String
    var appName: String
    var discription: String
    var githubLink: URL?
    var twitter: URL?
    var linkedIn: URL?
    var resume: URL?
}
