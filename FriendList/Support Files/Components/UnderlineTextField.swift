//
//  UnderlineTextField.swift
//  FriendList
//
//  Created by jaewon on 2020/05/31.
//  Copyright © 2020 jaewon. All rights reserved.
//

import UIKit

class UnderlineTextField: UITextField, UITextFieldDelegate {

    let border = CALayer()

    public var lineColor : UIColor = UIColor.black {
        didSet {
            self.border.borderColor = lineColor.cgColor
        }
    }

    public var selectedLineColor : UIColor = UIColor.black

    public var lineHeight : CGFloat = CGFloat(1.0) {
        didSet {
            self.border.frame = self.borderFrame
        }
    }
    
    public var borderFrame: CGRect {
        return CGRect(x: 0, y: self.frame.size.height - self.lineHeight, width:  self.frame.size.width, height: self.frame.size.height)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }

    required init?(coder aDecoder: (NSCoder?)) {
        super.init(coder: aDecoder!)
        
        self.setup()
    }
    
    func setup() {
        self.delegate = self;
        self.border.borderColor = self.lineColor.cgColor
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "",
                                                               attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])


        self.border.frame = self.borderFrame
        self.border.borderWidth = self.lineHeight
        self.layer.addSublayer(self.border)
        self.layer.masksToBounds = true
    }

    override func draw(_ rect: CGRect) {
        self.border.frame = self.borderFrame
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.border.frame = self.borderFrame
        self.delegate = self
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.border.borderColor = self.selectedLineColor.cgColor
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        self.border.borderColor = self.lineColor.cgColor
    }
}
