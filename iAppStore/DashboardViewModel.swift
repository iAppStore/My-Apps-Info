//
//  DashboardViewModel.swift
//  iAppStore
//
//  Created by mohammad mugish on 28/01/22.
//

import Foundation
import Cenima
import SwiftUI

class DashboardViewModel: ObservableObject {
    @Published var allListOfData = [DashboardModel]()
    @Published var isPresent = false
    init() {
        let data = DashboardModel(screenShots: [ImageAssets.iAppStore.CenimaPreviewOne.rawValue, ImageAssets.iAppStore.CenimaPreviewTwo.rawValue, ImageAssets.iAppStore.CenimaPreviewThree.rawValue, ImageAssets.iAppStore.CenimaPreviewFour.rawValue], userName: "Mohammad Mugish", appName: "Cenima", discription: "I am an iOS developer, loved to think out off the box.", githubLink: URL(string: "Hello.com"), twitter: URL(string: "Hello.com"), linkedIn: URL(string: "Hello.com"),resume: URL(string: "Hello.com"), myView: AnyView(MainView()))
        loadData(data: data)
    }
    
    func loadData(data: DashboardModel) {
        allListOfData.append(data)
    }
    

}
