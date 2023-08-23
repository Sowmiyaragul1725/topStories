//
//  StoriesTableViewCell.swift
//  TopStories
//
//  Created by SowmiyaRagul on 22/08/23.
//

import UIKit

class StoriesTableViewCell: UITableViewCell {
    @IBOutlet weak var itemTypeLabel: UILabel?
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var multiMediaImage: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        multiMediaImage?.makeRounded()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setStoriesDetail(storiesDetail: Stories?) {
        itemTypeLabel?.text = storiesDetail?.item_type ?? ""
        titleLabel?.text = storiesDetail?.title ?? ""
        if let multiMediaFirstImage = storiesDetail?.multimedia?.first?.url {
            multiMediaImage?.load(urlString: multiMediaFirstImage)
        }
    }
}
