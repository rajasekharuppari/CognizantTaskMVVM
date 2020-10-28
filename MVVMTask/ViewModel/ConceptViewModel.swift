//
//  ConceptViewModel.swift
//  MVVMTask
//
//

import Foundation

/*struct ConceptViewModel {

    let concept: Concept
    private(set) var title = ""
    private(set) var row: [Row] = []

    init(concept: Concept) {
        self.concept = concept
        updateProperties()
    }
    
    private mutating func updateProperties() {
        title = title(concept: concept)
        row = row(concept: concept)
    }

}

extension ConceptViewModel {

    private func title(concept: Concept) -> String {
        return "Title: \(concept.title)"
    }

    private func row(concept: Concept) -> [Row] {
        return row
    }
}*/

/*import UIKit

var rowData = [Row]()
//var selectedAuthor: Item?

class RowViewModel {
    var data: [Row]?
    
    init(data: [Row]?) {
        self.data = data
    }
}

protocol RowDataDelegate {
    func getData()
}

class RowDataList: NSObject {
    
    var rows : [Row]?
    var delegate : RowDataDelegate?
    var tableView : UITableView?
    
}*/


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
