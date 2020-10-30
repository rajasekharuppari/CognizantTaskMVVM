//
//  ConceptViewModel.swift
//  MVVMTask
//
//

import Foundation

class ConceptViewModel : NSObject {
    
    private var apiService : APIService!
    private(set) var rowData : Concept! {
        didSet {
            self.bindViewModelToController()
        }
    }
    
    var bindViewModelToController : (() -> ()) = {}
    
    override init() {
        super.init()
        self.apiService =  APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetData { (rowData) in
            self.rowData = rowData
        }
    }
}
