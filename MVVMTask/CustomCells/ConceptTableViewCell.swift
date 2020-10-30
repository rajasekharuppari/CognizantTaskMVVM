//
//  ConcpetTableViewCell.swift
//  MVVMTask
//
//

import UIKit
import SDWebImage

class ConceptTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageData: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    var rowsData : Row? {
        didSet {
            imageData.sd_setImage(with: URL(string: rowsData!.imageHref ?? ""), placeholderImage: UIImage(named: "placeholder.png"))
            imageData.layer.cornerRadius = 5.0
            titleLbl.text = rowsData?.title
            descLbl.text = rowsData?.rowDescription
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
