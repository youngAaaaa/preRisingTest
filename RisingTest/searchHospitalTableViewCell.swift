//
//  searchHospitalTableViewCell.swift
//  RisingTest
//
//  Created by 안다영 on 2022/08/09.
//

import UIKit

class searchHospitalTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hospitalName: UILabel!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var kind: UILabel!
    @IBOutlet weak var address: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}
