//
//  Memo.swift
//  SwiftUIMemo
//
//  Created by Chuljin Hwang on 2022/01/22.
//

import SwiftUI

class Memo : Identifiable, ObservableObject {
    let id: UUID //identifiable
    @Published var content: String
    let insertDate : Date
    
    init(id: UUID = UUID(), content: String, insertDate: Date = Date()){
        self.id = id
        self.content = content
        self.insertDate = insertDate
    }
}

extension Memo: Equatable{
    static func == (lhs:Memo, rhs:Memo) -> Bool{
        return lhs.id == rhs.id
    }
}

//struct Memo: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
//
//struct Memo_Previews: PreviewProvider {
//    static var previews: some View {
//        Memo()
//    }
//}
