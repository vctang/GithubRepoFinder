//
//  RepoCell.swift
//  GithubDemo
//
//  Created by Vicky Tang on 2/16/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class RepoCell: UITableViewCell {

    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var repoImage: UIImageView!
    
    var repo: GithubRepo!
    {
        didSet{
            if let name = repo.name! as String? {
                self.nameLabel.text = name
            }
            
            if let stars = repo.stars! as Int? {
                self.starLabel.text = "\(stars)"
            }
            
            if let forks = repo.forks! as Int? {
                self.forksLabel.text = "\(forks)"
            }
            
            if let ownerHandle = repo.ownerHandle! as String? {
                self.ownerLabel.text = "by: \(ownerHandle)"
            }
            if let ownerAvatarURL = repo.ownerAvatarURL! as String? {
                let ownerUrl = URL(string: ownerAvatarURL)
                self.repoImage.setImageWith(ownerUrl!)
            }
            
            if let repoDescription = repo.repoDescription as String? {
                self.descriptionLabel.text = repoDescription
            }
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
