//
//  WordItemTableViewCell.swift
//  Dictionary
//
//  Created by admin on 05/10/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit

class WordItemTableViewCell: UITableViewCell {

    
    
    @IBOutlet private weak var txtWord: UILabel!
    @IBOutlet private weak var txtTypeWord: UILabel!
    @IBOutlet private weak var txtMeaning: UILabel!
    
    var textToSpeech:String?
    
    @IBAction func handleTextToSpeech(_ sender: UIButton) {
        guard let text = textToSpeech else { return  }
        Speech.speechAWord(text)
    }
    
    
    func setupOxfordVocabulary(oxford: OxfordVocabulary) {
        
        txtWord.text = oxford.word + " " + oxford.typeWord.trimmingCharacters(in: CharacterSet.newlines)
        txtTypeWord.text = oxford.pronounciation.isEmpty ? "N/A" : oxford.pronounciation
        txtMeaning.text = oxford.meaning
        customLabel()
    }
    func setupTOEICVocabulary(toeic: TOEICVocabulary){
        
        txtWord.text = toeic.word + " " + toeic.typeWord.trimmingCharacters(in: CharacterSet.newlines)
        txtTypeWord.text = toeic.pronounciation.isEmpty ? "N/A" : toeic.pronounciation
        txtMeaning.text = toeic.meaning
        customLabel()
    }
    func setupIrregularVerbs(irregular: IrregularVerbs){
        
        txtWord.text = irregular.verb
        txtTypeWord.text = irregular.simplepast + "\n" + irregular.pastparticiple
        txtMeaning.text = irregular.meaning
        customLabel()
    }
    func customLabel() {
        
        txtWord.font = UIFont(name: "Avenir-Heavy", size: 15)
        txtWord.textColor = UIColor(red: 26/255, green: 161/255, blue: 255/255, alpha: 1)
        
        txtTypeWord.font = UIFont(name: "Avenir-Heavy", size: 15)
        
        txtMeaning.font = UIFont(name: "Avenir-Heavy", size: 13)
        txtMeaning.numberOfLines = 0
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
