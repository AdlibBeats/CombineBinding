import Combine

precedencegroup DisposePrecedence {
    associativity: left
    
    lowerThan: DefaultPrecedence
}

infix operator ~> : DefaultPrecedence

public extension Publisher where Failure == Never {
    static func ~> (publisher: Self, binder: ((Self.Output) -> Void)?)  -> AnyCancellable {
        publisher.sink(receiveValue: { binder?($0) })
    }
    
    static func ~> (publisher: Self, binder: ((Self.Output?) -> Void)?)  -> AnyCancellable {
        publisher.sink(receiveValue: { binder?($0) })
    }
    
    static func ~> <S: Subject>(publisher: Self, subject: S) -> AnyCancellable where S.Output == Self.Output {
        publisher.sink(receiveValue: { subject.send($0) })
    }
    
    static func ~> <S: Subject>(publisher: Self, subject: S) -> AnyCancellable where S.Output == Self.Output? {
        publisher.sink(receiveValue: { subject.send($0) })
    }
}

infix operator ~ : DisposePrecedence

public extension Set where Element == AnyCancellable {
    static func ~ (cancellable: AnyCancellable, subscriptions: inout Set<AnyCancellable>) {
        cancellable.store(in: &subscriptions)
    }
    
    static func ~ (subscriptions: inout Set<AnyCancellable>, cancellable: AnyCancellable) {
        cancellable.store(in: &subscriptions)
    }
}

public extension Array where Element == AnyCancellable {
    static func ~ (cancellables: Array, subscriptions: inout Set<AnyCancellable>) {
        cancellables.forEach { $0.store(in: &subscriptions) }
    }
    
    static func ~ (subscriptions: inout Set<AnyCancellable>, cancellables: Array) {
        cancellables.forEach { $0.store(in: &subscriptions) }
    }
    
    static func ~ (cancellables: Array, cancellable: AnyCancellable) -> [AnyCancellable] {
        cancellables + [cancellable]
    }
    
    static func ~ (cancellables1: Array, cancellables2: Array) -> [AnyCancellable] {
        cancellables1 + cancellables2
    }
}

public func ~ (cancellable1: AnyCancellable, cancellable2: AnyCancellable) -> [AnyCancellable] {
    [cancellable1, cancellable2]
}
