//
//  DetailVocabularyViewController.swift
//  Dictionary
//
//  Created by admin on 05/10/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit

class DetailVocabularyViewController: UIViewController {
    
    @IBOutlet weak var vocabularyTableView: UITableView!
    @IBOutlet weak var titleBar: UILabel!
    @IBOutlet weak var searchWord: UISearchBar!
    
    var toeicArray:[TOEICVocabulary]?
    var oxfordArray:[OxfordVocabulary]?
    var irregularArray:[IrregularVerbs]?
    
    var searchToeicArray:[TOEICVocabulary]?
    var searchOxfordArray:[OxfordVocabulary]?
    var searchIrregularArray:[IrregularVerbs]?
    
    var index:Int?
    var textToSpeech:String?
    var tieude:String?
    var isSearching:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleBar.text = tieude ?? "Nil"
        searchWord.delegate = self
        searchWord.showsCancelButton = true
        vocabularyTableView.delegate = self
        vocabularyTableView.dataSource = self
    }
    
    @IBAction func dismissVC(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
extension DetailVocabularyViewController :UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
}
extension DetailVocabularyViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            switch index {
            case 0:
                guard let count = searchOxfordArray?.count else { return 0 }
                return count
            case 1:
                guard let count = searchToeicArray?.count else { return 0 }
                return count
            case 2:
                guard let count = searchIrregularArray?.count else { return 0 }
                return count
            default:
                return 0
            }
        } else {
            switch index {
            case 0:
                guard let count = oxfordArray?.count else { return 0 }
                return count
            case 1:
                guard let count = toeicArray?.count else { return 0 }
                return count
            case 2:
                guard let count = irregularArray?.count else { return 0 }
                return count
            default:
                return 0
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.wordItemTableViewCell, for: indexPath) as! WordItemTableViewCell
        if isSearching {
            switch index {
            case 0:
                let oxfordItem = searchOxfordArray![indexPath.row]
                cell.setupOxfordVocabulary(oxford: oxfordItem)
                cell.textToSpeech = oxfordItem.word
                break
            case 1:
                let toeicItem = searchToeicArray![indexPath.row]
                cell.setupTOEICVocabulary(toeic: toeicItem)
                cell.textToSpeech = toeicItem.word
                break
            case 2:
                let irregularItem = searchIrregularArray![indexPath.row]
                cell.setupIrregularVerbs(irregular: irregularItem)
                cell.textToSpeech = irregularItem.verb
                break
            default:
                break
            }
        } else {
            switch index {
            case 0:
                let oxfordItem = oxfordArray![indexPath.row]
                cell.setupOxfordVocabulary(oxford: oxfordItem)
                cell.textToSpeech = oxfordItem.word
                break
            case 1:
                let toeicItem = toeicArray![indexPath.row]
                cell.setupTOEICVocabulary(toeic: toeicItem)
                cell.textToSpeech = toeicItem.word
                break
            case 2:
                let irregularItem = irregularArray![indexPath.row]
                cell.setupIrregularVerbs(irregular: irregularItem)
                cell.textToSpeech = irregularItem.verb
                break
            default:
                break
            }
        }
        
        return cell
    }
    
    
}
extension DetailVocabularyViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = true
        switch index {
        case 0:
            searchOxfordArray = oxfordArray?.filter { (vocabulary:OxfordVocabulary) -> Bool in
                return vocabulary.word.lowercased().contains(searchText.lowercased())
            }
            vocabularyTableView.reloadData()
            break
        case 1:
            searchToeicArray = toeicArray?.filter{ (vocabulary:TOEICVocabulary) -> Bool in
                return vocabulary.word.lowercased().contains(searchText.lowercased())
            }
            vocabularyTableView.reloadData()
            break
        case 2:
            searchIrregularArray = irregularArray?.filter({ (vocabulary:IrregularVerbs) -> Bool in
                return vocabulary.verb.lowercased().contains(searchText.lowercased())
            })
            vocabularyTableView.reloadData()
            break
        default:
            break
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchWord.text = ""
        searchWord.resignFirstResponder()
        vocabularyTableView.reloadData()
    }
}
