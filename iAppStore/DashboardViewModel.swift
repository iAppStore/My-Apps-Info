//
//  DashboardViewModel.swift
//  iAppStore
//
//  Created by mohammad mugish on 28/01/22.
//

import Foundation
import Cenima
import SwiftUI
import XCalendar

class DashboardViewModel: ObservableObject {
    @Published var allListOfData = [DashboardModel]()
    @Published var isPresent = false
    init() {
        let data = DashboardModel(screenShots: [ImageAssets.iAppStore.CenimaPreviewOne.rawValue, ImageAssets.iAppStore.CenimaPreviewTwo.rawValue, ImageAssets.iAppStore.CenimaPreviewThree.rawValue, ImageAssets.iAppStore.CenimaPreviewFour.rawValue], userName: "Mohammad Mugish", appName: "Cenima", discription: "I am an iOS developer, loved to think out off the box.", githubLink: URL(string: "Hello.com"), twitter: URL(string: "Hello.com"), linkedIn: URL(string: "Hello.com"),resume: URL(string: "Hello.com"), view: AnyView(MainView()))
        loadData(data: data)
        
        let xcalendarApp = DashboardModel(screenShots: [ ImageAssets.iAppStore.CenimaPreviewFour.rawValue], userName: "Yasir", appName: "XCalendar", discription: "Created a component of calendar", githubLink: URL(string: "https://github.com/myawesomehub/XCalendar"), twitter: URL(string: ""), linkedIn: URL(string: ""),resume: URL(string: ""), view: AnyView(XCalendarApp()))
        
        loadData(data: xcalendarApp)
    }
    
    func loadData(data: DashboardModel) {
        allListOfData.append(data)
    }
    

}
