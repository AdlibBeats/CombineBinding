//
//  TestViewController.swift
//  CombineBinding
//
//  Created by Andrew on 25.07.2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Combine
import CombineBinding
import UIKit

final class TestViewController: UIViewController {
    typealias ViewModel = TestViewModelProtocol
    
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        func bind() {
            let output = viewModel.transform(.init())
            UIButton().setBackgroundImage(<#T##image: UIImage?##UIImage?#>, for: <#T##UIControl.State#>)
            output.navBarTitle ~> cb.title ~ subscriptions
        }
        
        bind()
    }
}

