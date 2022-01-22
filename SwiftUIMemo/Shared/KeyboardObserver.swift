//
//  KeyboardObserver.swift
//  SwiftUIMemo
//
//  Created by Chuljin Hwang on 2022/01/22.
//

import UIKit
import Combine

class KeyboardObserver: ObservableObject{
    struct Context{
        let animationDuration: TimeInterval
        let height: CGFloat
        
        static let hide = Self(animationDuration: 0.25, height: 0)
        
    }
    @Published var context = Context.hide //값이 업데이트 되면 연관뷰가 업데이트 되도록 선선
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        let willShow = NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)
        let willHide = NotificationCenter.default.publisher(for: UIResponder.keyboardDidHideNotification)
        willShow.merge(with: willHide)
            .compactMap(parse)
            .assign(to: \.context, on: self)
            .store(in: &cancellables) //메모리 정리래
    }
    func parse(notification: Notification) -> Context?{
        guard let userInfo = notification.userInfo else{return nil}
        let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets
        let animationDuration = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSNumber)?.doubleValue ?? 0.25
        var height : CGFloat = 0
        if let value = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            let frame = value.cgRectValue
            if frame.origin.y < UIScreen.main.bounds.height{
                height = frame.height - (safeAreaInsets?.bottom ?? 0)
        }
    }
        return Context(animationDuration: animationDuration, height: height)
}
}
