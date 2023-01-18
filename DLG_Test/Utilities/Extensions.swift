//
//  Extensions.swift
//  DLG_Test
//
//  Created by Achintha kahawalage on 2023-01-15.
//

import UIKit

extension UIButton {
    
    func designable(title: String){
        self.backgroundColor = UIColor(named: "green")
        self.setTitle(title, for: .normal)
        self.setTitleColor(UIColor(named: "black"), for: .normal)
        self.titleLabel?.font = UIFont(name: "Oswald-Bold", size: 18)
        self.heightAnchor.constraint(equalToConstant: 44).isActive = true
    }
}

extension UILabel {
    
    func designable(fullText:String, text: String?, text2: String?, font: UIFont, firstColor: UIColor) {
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: fullText)
        attributedString.setColorForText(textForAttribute: text ?? "", withColor: firstColor)
        attributedString.setColorForText(textForAttribute: text2 ?? "", withColor: UIColor(named: "green")!)
        self.textAlignment = .center
        self.font = font

        self.attributedText = attributedString
    }
    
    func resultDescription(text: String){
        self.text = text
        self.font = UIFont(name: "Oswald-Bold", size: 16)
        self.textColor = UIColor(named: "white")
    }
    
    func result(text: String){
        self.text = text
        self.font = UIFont(name: "Roboto-Light", size: 14)
        self.textColor = UIColor(named: "white")
    }
}

extension NSMutableAttributedString {

    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }

}

extension UIStackView {
    func addArrangedSubviews(_ subviews: [UIStackView]) {
        subviews.forEach{ self.addArrangedSubview($0) }
    }
}
