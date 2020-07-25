//
//  TestViewModel.swift
//  CombineBinding
//
//  Created by Andrew on 25.07.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Combine
import CombineBinding

protocol TestViewModelProtocol: class {
    typealias Input = TestViewModel.Input
    typealias Output = TestViewModel.Output
    
    func transform(_ input: Input) -> Output
}

final class TestViewModel: TestViewModelProtocol {
    private let model = Model()
    
    func transform(_ input: Input) -> Output {
        Output(navBarTitle: model.navBarTitle.eraseToAnyPublisher())
    }
}

// Mark: Model, Input, Output
extension TestViewModel {
    struct Model {
        let navBarTitle = Just("Test message")
    }
    
    struct Input {
        
    }
    
    struct Output {
        let navBarTitle: AnyPublisher<String, Never>
    }
}
