//
//  UITextField.swift
//  RisingTest
//
//  Created by 안다영 on 2022/08/08.
//

import UIKit

extension UITextField {
    
    func addLeftPadding(width: Int) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: Int(self.frame.height)))
        self.leftView = paddingView
        self.leftViewMode = ViewMode.always
    }
    
    func addRightPadding(width: Int) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: width, height: Int(self.frame.height)))
        self.rightView = paddingView
        self.rightViewMode = ViewMode.always
    }
}
