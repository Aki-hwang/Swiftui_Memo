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
    @Binding var showComposer : Bool
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("", text: $content) // content랑 textfield가 묶인거래

            }
            .frame(maxWidth: . infinity, maxHeight: .infinity) //가장 크게 설정
            .navigationBarTitle("새 메모", displayMode: .inline)
            .navigationBarItems(leading: DissmissButton(show: $showComposer), trailing: SaveButton(show: $showComposer))
        }
    }
}

fileprivate struct DissmissButton : View{
    @Binding var show: Bool
    var body: some View{
        Button(action: {
            self.show = false
        }, label: {
            Text("취소")
        })
    }
}
fileprivate struct SaveButton: View{
    @Binding var show: Bool
    var body: some View{
        Button(action: {
            self.show = false
        }, label: {
            Text("저장")
        })
    }
}

struct ComposeScene_Previews: PreviewProvider {
    static var previews: some View {
        ComposeScene(showComposer: .constant(false)) //showComposer 값이 없으므로 Constant값 전달
            .environmentObject(MemoStore())
    }
}
