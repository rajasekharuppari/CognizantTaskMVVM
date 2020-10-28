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
            titleLbl.text = rowsData?.title
            descLbl.text = rowsData?.rowDescription
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
