//
//  PostCell.swift
//  CleanHood
//
//  Created by Arinjay on 19/10/16.
//  Copyright © 2016 Arinjay. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(post: Post){
        titleLbl.text = post.title
        descLbl.text = post.PostDesc
    }
   

}
