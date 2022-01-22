//
//  ContentView.swift
//  SwiftUIMemo
//
//  Created by Chuljin Hwang on 2022/01/22.
//

import SwiftUI

struct MemoListScene: View {
    @EnvironmentObject var store: MemoStore //형식에 맞게 제공
    @EnvironmentObject var formatter: DateFormatter
    var body: some View {
        NavigationView {
            List(store.list){ memo in
                MemoCell(memo: memo)
            }
            .navigationBarTitle("내 메모")
        }
    }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
        
    }
}

