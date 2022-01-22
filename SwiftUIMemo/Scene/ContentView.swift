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
            //삭제넣으려면 foreach로
            List {
                ForEach(store.list){ memo in
                    //상세화면은 슬라이드 푸쉬로 표시 >> 네비게이션 링크를 사용
                    NavigationLink(destination: DetailScene(memo:memo), label: {
                        MemoCell(memo: memo)
                    })
                    
                }
                .onDelete(perform: store.delete)//목록에서 삭제 하는 기느
            } //$showCompser 값이 True면 ComposeScene()가 실형된다
            .navigationBarTitle("내 메모")
            .navigationBarItems(trailing: ModalButton(show: $showComposer)) //$붙이면 바인딩이 전달된다
            .sheet(isPresented: $showComposer, content: {
                ComposeScene(showComposer: self.$showComposer)
                    
//                    .environmentObject(self.store)
        })
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

