//
//  MemoStore.swift
//  SwiftUIMemo
//
//  Created by Chuljin Hwang on 2022/01/22.
//

import Foundation

class MemoStore: ObservableObject{
    @Published var list: [Memo]
    init(){
        list = [
            Memo(content: "lorem 1"),
            Memo(content: "lorem 2"),
            Memo(content: "lorem 3")
        ]
    }
    
    func inset(memo: String){
        list.insert(Memo(content: memo), at:0)
    }
    func updata(memo: Memo?, content: String){
        guard let memo = memo else{return}
        memo.content = content
    }
    func delete(memo: Memo){
        DispatchQueue.main.sync {
            self.list.removeAll { $0 == memo}
        }
      
    }
    func delete(set: IndexSet){
        for index in set{
            self.list.remove(at:index)
        }
    }
    
}
