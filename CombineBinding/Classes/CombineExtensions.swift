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
}

public extension Combine where Base: UILabel {
    var text: ((String?) -> Void) { { [weak base] in base?.text = $0 } }
}

public extension Combine where Base: UIDatePicker {
    var date: ((Date) -> Void) { { [weak base] in base?.date = $0 } }
    var minimumDate: ((Date?) -> Void) { { [weak base] in base?.minimumDate = $0 } }
    var maximumDate: ((Date?) -> Void) { { [weak base] in base?.maximumDate = $0 } }
    func setDate(animated: Bool) -> ((Date) -> Void) { { [weak base] in base?.setDate($0, animated: animated) } }
}
