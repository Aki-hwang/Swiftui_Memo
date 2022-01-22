//
//  ComposeScene.swift
//  SwiftUIMemo
//
//  Created by Chuljin Hwang on 2022/01/22.
//

import SwiftUI

struct ComposeScene: View {
    @EnvironmentObject var store: MemoStore
//    @EnvironmentObject var keybord: KeyboardObserver
    @State private var content: String = ""
    @Binding var showComposer : Bool
    
    //메모 편집위해 추가
    var memo: Memo? = nil //메모전달되면 편집모드 아니면 쓰기 모드
    
    
    
    var body: some View {
        NavigationView {
            VStack {
                TextView(text:$content) // content랑 textfield가 묶인거래. 텍스트 필드가 중간에 들어가거든 반드시 기억
                    .frame(maxWidth: . infinity, maxHeight: .infinity) //
//                    .padding(.bottom, keybord.context.height)
//                    .animation(.easeInOut(duration: keybord.context.animationDuration)) 버전 업으로 인해 키보드 필요 없어
//                    .background(Color.yellow)
            }
            .frame(maxWidth: . infinity, maxHeight: .infinity) //가장 크게 설정
            .navigationBarTitle(memo != nil ? "메모편집" : "새 메모", displayMode: .inline)
            //메모가 전달되면 메모편집
            .navigationBarItems(leading: DissmissButton(show: $showComposer), trailing: SaveButton(show: $showComposer, content: $content, memo: memo))
        }
        .onAppear{
            self.content = self.memo?.content ?? ""
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
    @EnvironmentObject var store : MemoStore //자동으로 주입되도록
    @Binding var content: String // 입력한 텍스트는 바인딩으로 받을꺼야
    
    var memo: Memo? = nil //편집을 위해
    var body: some View{
        Button(action: {
            if let memo = self.memo {
                
                self.store.updata(memo:memo, content: self.content) // 여기서 왜 updata로 하면 되는지 모르겠어 ㅠㅜ
            }else{
                self.store.inset(memo: self.content)
            }
            self.store.inset(memo: self.content) //메모를 저장하는 코드
            self.show = false //버튼이 눌리면 값 변경
        }, label: {
            Text("저장")
        })
    }
}

struct ComposeScene_Previews: PreviewProvider {
    static var previews: some View {
        ComposeScene(showComposer: .constant(false)) //showComposer 값이 없으므로 Constant값 전달
            .environmentObject(MemoStore())
//            .environmentObject(KeyboardObserver())
    }
}
