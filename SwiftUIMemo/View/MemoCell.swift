//
//  MemoCell.swift
//  SwiftUIMemo
//
//  Created by Chuljin Hwang on 2022/01/22.
//

import SwiftUI

struct MemoCell: View {
    @ObservedObject var memo: Memo // 항상 최신 데이터 확보를 위해 observedobject사용
    @EnvironmentObject var formatter: DateFormatter
    var body: some View {
        VStack(alignment: .leading) {
            Text(memo.content)
                .font(.body)
                .lineLimit(1)
            
            Text("\(memo.insertDate, formatter: self.formatter)") //desciption 속성으로 우선 출력
                .font(.caption)
                .foregroundColor(Color(uiColor: .secondaryLabel))
        }
    }
}

struct MemoCell_Previews: PreviewProvider {
    static var previews: some View {
        MemoCell(memo: Memo(content: "Test"))
            .environmentObject(DateFormatter.memoDateFormatter)
        
    }
}
