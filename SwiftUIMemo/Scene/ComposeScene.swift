//
//  ComposeScene.swift
//  SwiftUIMemo
//
//  Created by Chuljin Hwang on 2022/01/22.
//

import SwiftUI

struct ComposeScene: View {
    @EnvironmentObject var store: MemoStore
    @State private var content: String = ""
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("", text: $content) // content랑 textfield가 묶인거래

            }
            .frame(maxWidth: . infinity, maxHeight: .infinity) //가장 크게 설정
            .navigationBarTitle("새 메모", displayMode: .inline)
            .navigationBarItems(leading: DissmissButton(), trailing: SaveButton())
        }
    }
}

fileprivate struct DissmissButton : View{
    var body: some View{
        Button(action: {
            
        }, label: {
            Text("취소")
        })
    }
}
fileprivate struct SaveButton: View{
    var body: some View{
        Button(action: {
            
        }, label: {
            Text("저장")
        })
    }
}

struct ComposeScene_Previews: PreviewProvider {
    static var previews: some View {
        ComposeScene()
            .environmentObject(MemoStore())
    }
}
