//
//  ViewController.swift
//  Dictionary
//
//  Created by admin on 11/09/2020.
//  Copyright © 2020 Last Destroyer. All rights reserved.
//

import UIKit
import AVFoundation


class MainViewController: UIViewController {

    
    @IBOutlet weak var dicttionaryFuncCV: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dicttionaryFuncCV.dataSource = self
        dicttionaryFuncCV.delegate = self
        view.setGradientBackground(firstColor: Colors.mediumBlue, secondColor: Colors.heavyBlack, thirdColor: Colors.lightBlue, fourColor: Colors.blackBlue)
    }
}
extension MainViewController : UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            self.performSegue(withIdentifier: StoryboardConstants.segueAnhViet, sender: nil)
            break
        case 1:
            self.performSegue(withIdentifier: StoryboardConstants.segueVietAnh, sender: nil)
            break
        case 2:
            self.performSegue(withIdentifier: StoryboardConstants.seguePhuDePhim, sender: nil)
            break
        case 3:
            self.performSegue(withIdentifier: StoryboardConstants.segueVocabularyImportant, sender: nil)
            break
        case 4:
            self.performSegue(withIdentifier: StoryboardConstants.segueWordSearchedVC, sender: nil)
            break
        default:
            break
        }
    }
    
}
extension MainViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Anh-Viet", for: indexPath) as! CustomCollectionViewCell
        cell.layer.cornerRadius = 10
        cell.layer.borderWidth = 2.5
        cell.layer.borderColor = UIColor(red: 66/255, green: 66/255, blue: 66/255, alpha: 66/255).cgColor
        switch indexPath.row {
        case 0:
            cell.customCollectionViewCell(imageName: "icons8-translation", title: "Từ đển Anh - Việt")
            break
        case 1:
            cell.customCollectionViewCell(imageName: "icons8-paid_search", title: "Từ điển Việt - Anh")
            break
        case 2:
            cell.customCollectionViewCell(imageName: "icons8-film_soundtracks", title: "Tìm phụ đề phim")
            break
        case 3:
            cell.customCollectionViewCell(imageName: "icons8-dictionary", title: "Từ vựng quan trọng")
            break
        case 4:
            cell.customCollectionViewCell(imageName: "icons8-time_machine", title: "Các từ đã tra")
        default:
            break
        }
        return cell
    }
    
    
}
extension MainViewController : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width - 20, height: 64)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }
    
}

