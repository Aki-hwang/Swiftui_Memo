//
//  DetailScene.swift
//  SwiftUIMemo
//
//  Created by Chuljin Hwang on 2022/01/22.
//

import SwiftUI

struct DetailScene: View {
    @ObservedObject var memo: Memo
    @EnvironmentObject var store: MemoStore
    @EnvironmentObject var formatter: DateFormatter
    @State private var showEditSheet = false
    
    var body: some View {
        VStack{
            ScrollView{
                VStack{
                    HStack {
                        Text(self.memo.content)
                            .padding()
                        Spacer()
                    }
                    Text("\(self.memo.insertDate, formatter: formatter)")
                        .padding()
                        .font(.footnote)
                        .foregroundColor(Color(UIColor.secondaryLabel))
                }
            }
            HStack{
                Button(action: {
                    self.showEditSheet.toggle()
                }, label: {
                        Image(systemName: "square.and.pencil")
                })
                    .padding()
                    .sheet(isPresented: $showEditSheet, content:{
                        ComposeScene(showComposer: self.$showEditSheet, memo:self.memo)
                            .environmentObject(self.store) //커스텀 공유 데이터로 등록
                    })
            }
        }// vstack 끝
        .navigationBarTitle("메모보기")
    }
}

struct DetailScene_Previews: PreviewProvider {
    static var previews: some View {
        DetailScene(memo: Memo(content: "Swift UI"))
            .environmentObject(MemoStore())
            .environmentObject(DateFormatter.memoDateFormatter)
    }
}
