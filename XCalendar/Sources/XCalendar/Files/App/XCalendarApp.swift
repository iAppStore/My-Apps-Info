//
//  XCalendarApp.swift
//  XCalendar
//
//  Created by Mohammad Yasir on 07/10/21.
//

import SwiftUI

public struct XCalendarApp: View {
    @Environment(\.presentationMode) var presentationMode
    public init() { }
    public var body: some View {
        XCalendar()
            .overlay(
                Image(systemName: "xmark.circle.fill")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
                    .padding()
                    .onTapGesture {
                        presentationMode.wrappedValue.dismiss()
                    }
                , alignment: .topTrailing
            )
    }
}
