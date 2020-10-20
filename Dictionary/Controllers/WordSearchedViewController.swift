//
//  WordSearchedViewController.swift
//  Dictionary
//
//  Created by admin on 19/10/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit

class WordSearchedViewController: UIViewController {

    @IBOutlet weak var wordSearchBar: UISearchBar!
    @IBOutlet weak var wordSearchedTableView: UITableView!
    
    
    var words:[Word] = []
    var examples:[Example] = []
    var isSearching = false
    var searchWord = [Word]()
    
    var database = DBLocalManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Các từ đã tra"
        wordSearchedTableView.dataSource = self
        wordSearchedTableView.delegate = self
        wordSearchBar.delegate = self
        wordSearchBar.showsCancelButton = true
        database.fetchWordFromLocal { (words) in
            self.words = words
            self.wordSearchedTableView.reloadData()
        }
    }
}
extension WordSearchedViewController:UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StoryboardConstants.wordSearchedCell, for: indexPath)
        let item = words[indexPath.row]
       cell.textLabel?.text = item.word
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedWord = words[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        database.fetchExampleFromLocal(with: selectedWord) { (samples) in
            self.examples = samples
        }
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: UIContextualAction.Style.destructive, title: "Delete") { (action, view, completionHandler) in
            let selectedWord = self.words[indexPath.row]
            self.database.delete(word: selectedWord)
        }
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}
extension WordSearchedViewController:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        isSearching = true
        searchWord = words.filter({ (word) -> Bool in
            return (word.word?.lowercased().contains(searchText.lowercased()))!
        })
        self.wordSearchedTableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        wordSearchBar.text = ""
        self.wordSearchedTableView.reloadData()
    }
}
