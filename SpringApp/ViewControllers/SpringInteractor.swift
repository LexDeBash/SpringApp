//
//  SpringInteractor.swift
//  SpringApp
//
//  Created by Alexey Efimov on 16.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol SpringBusinessLogic {
    func didTapView(request: SpringRequest)
}

protocol SpringDataStore {
    var animation: Animation { get }
}

class SpringInteractor: SpringBusinessLogic, SpringDataStore {
    
    var presenter: SpringPresentationLogic?
    var worker: SpringWorker?
    var animation = Animation()
    
    func didTapView(request: SpringRequest) {
        worker = SpringWorker()
        worker?.doSomeWork()
        
        let response = SpringResponse(animation: animation)
        presenter?.presentAnimation(response: response)
    }
}
