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
    
    static var cb: Combine<CombineBase>.Type { get set }

    var cb: Combine<CombineBase> { get set }
}

public extension CombineCompatible {
    static var cb: Combine<Self>.Type {
        get { Combine<Self>.self }
        set { }
    }
    
    var cb: Combine<Self> {
        get { Combine(self) }
        set { }
    }
}

import class Foundation.NSObject

extension NSObject: CombineCompatible { }

public extension Combine where Base: UIViewController {
    var title: ((String?) -> Void) { { [weak base] in base?.title = $0 } }
}

public extension Combine where Base: UILabel {
    var text: ((String?) -> Void) { { [weak base] in base?.text = $0 } }
}
