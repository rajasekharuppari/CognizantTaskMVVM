//
//  ViewController.swift
//  MVVMTask
//
//


import UIKit
import SDWebImage

class ControllerVC: UIViewController {
    
    @IBOutlet weak var mainTitle: UILabel!
    @IBOutlet weak var conceptTableView: UITableView!
    private var conceptViewModel : ConceptViewModel!
    private var dataSource : ConceptTableViewDataSource<ConceptTableViewCell,Row>!

    override func viewDidLoad() {
        super.viewDidLoad()
        mainTitle.text = "About Canada"
        callToViewModelForUIUpdate()
    }
    
    func callToViewModelForUIUpdate(){
        self.conceptViewModel =  ConceptViewModel()
        self.conceptViewModel.bindViewModelToController = {
            self.updateDataSource()
        }
    }
    
    func updateDataSource(){
        self.dataSource = ConceptTableViewDataSource(cellIdentifier: "Cell", items: self.conceptViewModel.rowData.rows!, configureCell: { (cell, evm) in
            cell.imageData.sd_setImage(with: URL(string: evm.imageHref ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            cell.titleLbl.text = evm.title
            cell.descLbl.text = evm.rowDescription
        })
        
        DispatchQueue.main.async {
            self.conceptTableView.dataSource = self.dataSource
            self.conceptTableView.reloadData()
        }
    }
    
}
