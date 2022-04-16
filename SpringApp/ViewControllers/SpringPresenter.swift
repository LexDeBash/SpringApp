//
//  SpringPresenter.swift
//  SpringApp
//
//  Created by Alexey Efimov on 16.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol SpringPresentationLogic {
    func presentSomething(response: Spring.Animation.Response)
}

class SpringPresenter: SpringPresentationLogic {
    
    weak var viewController: SpringDisplayLogic?
    
    func presentSomething(response: Spring.Animation.Response) {
        let viewModel = Spring.Animation.ViewModel()
        viewController?.displaySomething(viewModel: viewModel)
    }
}
