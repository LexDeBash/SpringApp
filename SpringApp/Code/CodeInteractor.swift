//
//  CodeInteractor.swift
//  SpringApp
//
//  Created by Alexey Efimov on 18.04.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol CodeBusinessLogic {
    func doSomething(request: Code.PresentCode.Request)
}

protocol CodeDataStore {
    
}

class CodeInteractor: CodeBusinessLogic, CodeDataStore {
    
    var presenter: CodePresentationLogic?
    var worker: CodeWorker?
    
    func doSomething(request: Code.PresentCode.Request) {
        worker = CodeWorker()
        worker?.doSomeWork()
        
        let response = Code.PresentCode.Response()
        presenter?.presentSomething(response: response)
    }
}