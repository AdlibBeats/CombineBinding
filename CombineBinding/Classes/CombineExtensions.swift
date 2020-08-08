//
//  CombineExtensions.swift
//  CombineBinding
//
//  Created by Andrew on 25.07.2020.
//

import UIKit

public struct Combine<Base> {
    public let base: Base

    public init(_ base: Base) {
        self.base = base
    }
}

public protocol CombineCompatible {
    associatedtype CombineBase
    
    static var cb: Combine<CombineBase>.Type { get }

    var cb: Combine<CombineBase> { get }
}

public extension CombineCompatible {
    static var cb: Combine<Self>.Type { Combine<Self>.self }
    
    var cb: Combine<Self> { Combine(self) }
}

import class Foundation.NSObject

extension NSObject: CombineCompatible { }

public extension Combine where Base: UIViewController {
    var title: ((String?) -> Void) { { [weak base] in base?.title = $0 } }
}

public extension Combine where Base: UIButton {
    func setTitle(for state: UIControl.State) -> ((String?) -> Void) { { [weak base] in base?.setTitle($0, for: state) } }
    func setTitleColor(for state: UIControl.State) -> ((UIColor?) -> Void) { { [weak base] in base?.setTitleColor($0, for: state) } }
    func setImage(for state: UIControl.State) -> ((UIImage?) -> Void) { { [weak base] in base?.setImage($0, for: state) } }
    func setBackgroundImage(for state: UIControl.State) -> ((UIImage?) -> Void) { { [weak base] in base?.setBackgroundImage($0, for: state) } }
}

public extension Combine where Base: UIDatePicker {
    var date: ((Date) -> Void) { { [weak base] in base?.date = $0 } }
    var minimumDate: ((Date?) -> Void) { { [weak base] in base?.minimumDate = $0 } }
    var maximumDate: ((Date?) -> Void) { { [weak base] in base?.maximumDate = $0 } }
    func setDate(animated: Bool) -> ((Date) -> Void) { { [weak base] in base?.setDate($0, animated: animated) } }
    var datePickerMode: ((UIDatePicker.Mode) -> Void) { { [weak base] in base?.datePickerMode = $0 } }
}

public extension Combine where Base: UITextField {
    var text: ((String?) -> Void) { { [weak base] in base?.text = $0 } }
    var textColor: ((UIColor?) -> Void) { { [weak base] in base?.textColor = $0 } }
    var textAlignment: ((NSTextAlignment) -> Void) { { [weak base] in base?.textAlignment = $0 } }
    var font: ((UIFont) -> Void) { { [weak base] in base?.font = $0 } }
}

public extension Combine where Base: UITextView {
    var text: ((String?) -> Void) { { [weak base] in base?.text = $0 } }
    var textColor: ((UIColor?) -> Void) { { [weak base] in base?.textColor = $0 } }
    var textAlignment: ((NSTextAlignment) -> Void) { { [weak base] in base?.textAlignment = $0 } }
    var font: ((UIFont?) -> Void) { { [weak base] in base?.font = $0 } }
}

public extension Combine where Base: UILabel {
    var text: ((String?) -> Void) { { [weak base] in base?.text = $0 } }
    var textColor: ((UIColor?) -> Void) { { [weak base] in base?.textColor = $0 } }
    var textAlignment: ((NSTextAlignment) -> Void) { { [weak base] in base?.textAlignment = $0 } }
    var font: ((UIFont) -> Void) { { [weak base] in base?.font = $0 } }
    var lineBreakMode: ((NSLineBreakMode) -> Void) { { [weak base] in base?.lineBreakMode = $0 } }
    var numberOfLines: ((Int) -> Void) { { [weak base] in base?.numberOfLines = $0 } }
}

public extension Combine where Base: CALayer {
    var cornerRadius: ((CGFloat) -> Void) { { [weak base] in base?.cornerRadius = $0 } }
}

public extension Combine where Base: UIControl {
    var isEnabled: ((Bool) -> Void) { { [weak base] in base?.isEnabled = $0 } }
    var isSelected: ((Bool) -> Void) { { [weak base] in base?.isSelected = $0 } }
    var isHighlighted: ((Bool) -> Void) { { [weak base] in base?.isHighlighted = $0 } }
}

public extension Combine where Base: UIControl {
    var isUserInteractionEnabled: ((Bool) -> Void) { { [weak base] in base?.isUserInteractionEnabled = $0 } }
}

public extension Combine where Base: UIView {
    var isHidden: ((Bool) -> Void) { { [weak base] in base?.isHidden = $0 } }
    var backgroundColor: ((UIColor?) -> Void) { { [weak base] in base?.backgroundColor = $0 } }
    var tintColor: ((UIColor?) -> Void) { { [weak base] in base?.tintColor = $0 } }
}
