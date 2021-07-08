//
//  CustomUIView.swift
//  ColorSelectorApp
//
//  Created by Ken Takahashi on 2021/06/21.
//

import UIKit

class CustomUIView: UIView {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.bounds.midY
    }
}
