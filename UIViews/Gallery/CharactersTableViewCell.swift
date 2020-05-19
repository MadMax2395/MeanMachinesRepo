//
//  CharactersTableViewCell.swift
//  SpaceRace
//
//  Created by fernando rosa on 24/11/2019.
//  Copyright © 2019 fernando rosa. All rights reserved.
//

import UIKit

protocol CharactersTableViewCellDelegate {
    func characterButtonPressed(character:Int)
}

class CharactersTableViewCell: UITableViewCell {
    
    var delegate: CharactersTableViewCellDelegate?
    var selectedCharacter:Int = -1
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var character1: UIImageView!
    @IBOutlet var characterBtn1: UIButton!
    @IBOutlet var character2: UIImageView!
    @IBOutlet var characterBtn2: UIButton!
    @IBOutlet var character3: UIImageView!
    @IBOutlet var characterBtn3: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        scrollView.contentOffset.x = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func characterTap(_ sender: Any) {
        self.selectedCharacter = (sender as! UIButton).tag
        self.delegate?.characterButtonPressed(character:self.selectedCharacter)
    }
    
    func initCell(characters:[Character]) {
        // setto solo il primo, da fare il resto
        self.character1.image = UIImage(named: characters[0].image)
        self.characterBtn1.isHidden = false
        self.characterBtn1.tag = 1
    }

}
