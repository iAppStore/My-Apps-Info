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
    @Published var selectedCell = DashboardModel()
    @Published var isPresent = false
    init() {
        let data = DashboardModel(screenShots: [ImageAssets.Cenima.CenimaPreviewOne.rawValue, ImageAssets.Cenima.CenimaPreviewTwo.rawValue, ImageAssets.Cenima.CenimaPreviewThree.rawValue, ImageAssets.Cenima.CenimaPreviewFour.rawValue], userName: "Mohammad Mugish", appName: "Cenima", discription: "I am an iOS developer, loved to think out off the box.", githubLink: URL(string: "https://github.com/iAppStore/My-Apps-Info/tree/main/Cenimaa"), twitter: URL(string: "https://twitter.com/md_mugish"), linkedIn: URL(string: "https://www.linkedin.com/in/mdmugish/"),resume: URL(string: ""), view: AnyView(MainView()))
        loadData(data: data)
        
        let xcalendarApp = DashboardModel(screenShots: [ ImageAssets.XCalendar.XCalendarPreviewFour.rawValue], userName: "Yasir", appName: "XCalendar", discription: "Created a component of calendar", githubLink: URL(string: "https://github.com/iAppStore/My-Apps-Info/tree/main/XCalendar"), twitter: URL(string: ""), linkedIn: URL(string: ""),resume: URL(string: ""), view: AnyView(XCalendarApp()))
        
        loadData(data: xcalendarApp)
    }
    
    func loadData(data: DashboardModel) {
        allListOfData.append(data)
    }
    

}
