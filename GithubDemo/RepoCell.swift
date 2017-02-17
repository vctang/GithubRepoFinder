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
            if let name = jsonResult["name"] as? String {
                self.name = name
            }
            
            if let stars = jsonResult["stargazers_count"] as? Int? {
                self.stars = stars
            }
            
            if let forks = jsonResult["forks_count"] as? Int? {
                self.forks = forks
            }
            
            if let owner = jsonResult["owner"] as? NSDictionary {
                if let ownerHandle = owner["login"] as? String {
                    self.ownerHandle = ownerHandle
                }
                if let ownerAvatarURL = owner["avatar_url"] as? String {
                    self.ownerAvatarURL = ownerAvatarURL
                }
            }
            
            if let repoDescription = jsonResult["description"] as? String {
                self.repoDescription = repoDescription
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        repoImage.setImageWithURL()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
