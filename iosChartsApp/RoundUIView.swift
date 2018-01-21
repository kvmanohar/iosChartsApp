//
//  RoundUIView.swift
//  iosChartsApp
//
//  Created by Manohar Kurapati on 21/01/2018.
//  Copyright © 2018 Manosoft. All rights reserved.
//


import UIKit

@IBDesignable
class RoundUIView: UIView {
    
    @IBInspectable var cournerRadius: CGFloat = 8.0 {
        didSet{
            self.setupView()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 3.0 {
        didSet{
            self.setupView()
        }
    }
    
    override func awakeFromNib() {
        setupView()
        super.awakeFromNib()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        self.setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = cournerRadius
        self.layer.shadowOpacity = 0.75
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
