//
//  ViewController.swift
//  MVVMTask
//
//


import UIKit
import SDWebImage

class ControllerVC: UIViewController {
    var refreshControl = UIRefreshControl()

    @IBOutlet weak var conceptTableView: UITableView!
    private var conceptViewModel : ConceptViewModel!
    private var dataSource : ConceptTableViewDataSource<ConceptTableViewCell,Row>!

    override func viewDidLoad() {
        super.viewDidLoad()
        conceptTableView.rowHeight = UITableView.automaticDimension
        conceptTableView.estimatedRowHeight = 300
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        conceptTableView.addSubview(refreshControl)
        callToViewModelForUIUpdate()
    }
    
    
    // MARK: - Custom methods

    func callToViewModelForUIUpdate(){
        self.conceptViewModel =  ConceptViewModel()
        self.conceptViewModel.bindViewModelToController = {
            self.updateDataSource()
        }
    }
    
    @objc func refresh(_ sender: Any) {
        callToViewModelForUIUpdate()
        refreshControl.endRefreshing()
    }
    
    func updateDataSource(){
        self.dataSource = ConceptTableViewDataSource(cellIdentifier: "Cell", items: self.conceptViewModel.rowData.rows!, configureCell: { (cell, evm) in
            cell.imageData.sd_setImage(with: URL(string: evm.imageHref ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            cell.imageData.layer.cornerRadius = 5.0
            cell.titleLbl.text = evm.title
            cell.descLbl.text = evm.rowDescription
        })
        DispatchQueue.main.async {
            self.conceptTableView.dataSource = self.dataSource
            self.conceptTableView.reloadData()
        }
    }
}
