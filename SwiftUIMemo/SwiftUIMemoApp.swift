//
//  SwiftUIMemoApp.swift
//  SwiftUIMemo
//
//  Created by Chuljin Hwang on 2022/01/22.
//

import SwiftUI
@main
struct SwiftUIMemoApp: App {
    var body: some Scene {
        WindowGroup {
            MemoListScene()
                .environmentObject(MemoStore())
                .environmentObject(DateFormatter.memoDateFormatter)
           
        }
    }
}
