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
    
    @State var showComposer: Bool = false
    
    var body: some View {
        NavigationView {
            List(store.list){ memo in
                MemoCell(memo: memo)
            }
            .navigationBarTitle("내 메모")
            .navigationBarItems(trailing: ModalButton(show: $showComposer)) //$붙이면 바인딩이 전달된다
            .sheet(isPresented: $showComposer, content: {
                ComposeScene(showComposer: self.$showComposer)
                    
//                    .environmentObject(self.store)
            }) //$showCompser 값이 True면 ComposeScene()가 실형된다
        }
    }
}
fileprivate struct ModalButton: View{
    @Binding var show: Bool //다른 곳의 속성을 바꾸기 위해 사용
    var body: some View{
        Button(action: {
            self.show = true
        }, label: { Image(systemName: "plus")
    })
  }
}

struct MemoListScene_Previews: PreviewProvider {
    static var previews: some View {
        MemoListScene()
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter) //simulation을 위해 app으로 전달 필요
            
        
    }
}

