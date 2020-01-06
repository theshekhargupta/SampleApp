//
//  DHCollectionTableViewController.swift
//  DHCollectionTableView
//
//  Created by 胡大函 on 14/11/3.
//  Copyright (c) 2014年 HuDahan_payMoreGainMore. All rights reserved.
//

import UIKit

let reuseTableViewCellIdentifier = "TableViewCell"
let reuseCollectionViewCellIdentifier = "CollectionViewCell"

class DHCollectionTableViewController: UITableViewController {

    var sourceArray: Array<AnyObject>!
    var contentOffsetDictionary: Dictionary<AnyHashable, AnyObject>!

    convenience init(source: Array<AnyObject>) {
        self.init()
        tableView.register(DHCollectionTableViewCell.self, forCellReuseIdentifier: reuseTableViewCellIdentifier)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        sourceArray = source
        contentOffsetDictionary = Dictionary<NSObject, AnyObject>()
    }

}
// MARK: - Table view data source
extension DHCollectionTableViewController {

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sourceArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseTableViewCellIdentifier, for: indexPath) as! DHCollectionTableViewCell
        return cell
    }

    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let collectionCell = cell as! DHCollectionTableViewCell
        collectionCell.setCollectionViewDataSourceDelegate(dataSourceDelegate: self, index: (indexPath as NSIndexPath).row)

        let index = collectionCell.collectionView.tag
        let value = contentOffsetDictionary[index]
        let horizontalOffset = CGFloat(value != nil ? value!.floatValue : 0)
        collectionCell.collectionView.setContentOffset(CGPoint(x: horizontalOffset, y: 0), animated: false)
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREEN_SIZE.SCREEN_HEIGHT / 5.6
    }
}
// MARK: - Collection View Data source and Delegate
extension DHCollectionTableViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let collectionViewArray = sourceArray[collectionView.tag] as! Array<AnyObject>
        return collectionViewArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: UICollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCollectionViewCellIdentifier, for: indexPath)
        cell.backgroundColor = UIColor.white

        let collectionViewArray = sourceArray[collectionView.tag] as! Array<AnyObject>
        let rowData: Dictionary<String, String> = collectionViewArray[indexPath.row] as! Dictionary<String, String>
        if let labelValue = rowData["label"] {
            cell.addSubview(self.createLabel(labelValue, cell: cell))
        }
        
        if let imageName = rowData["image"] {
            cell.addSubview(self.createImageView(imageName, cell: cell))
        }
        
//        let lineView = UIView(frame: CGRect(x: indexPath.row % 2 == 0 ? 20 : 0,
//                                            y: cell.frame.height - 1,
//                                            width: SCREEN_SIZE.SCREEN_WIDTH/2 - 20,
//                                            height: 1.0))
//        lineView.layer.borderWidth = 1.0
//        lineView.layer.borderColor = UIColor.blue.cgColor
//       cell.addSubview(lineView)




        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let collectionViewArray = sourceArray[collectionView.tag] as! Array<AnyObject>
        let rowData: Dictionary<String, AnyObject> = collectionViewArray[indexPath.row] as! Dictionary<String, AnyObject>

        let alert = UIAlertController(title: "collectionView\(collectionView.tag)",
            message: "message\((indexPath as NSIndexPath).item)",
            preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil))
        let v: UIView = UIView(frame: CGRect(x: 10, y: 20, width: 50, height: 50))
        if let labelValue = rowData["label"] as? String {
            // no error
            print(labelValue)
        }

        alert.view.addSubview(v)
        present(alert, animated: true, completion: nil)
    }

    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if !(scrollView is UICollectionView) {
            return
        }
        let horizontalOffset = scrollView.contentOffset.x
        let collectionView = scrollView as! UICollectionView
        contentOffsetDictionary[collectionView.tag] = horizontalOffset as AnyObject
    }


    func createLabel(_ textValue: String, cell: UICollectionViewCell) -> UILabel {
        let dynamicLabel: UILabel = UILabel(frame: CGRect(x: 0,
                                                          y: cell.frame.height - 25,
                                                          width: SCREEN_SIZE.SCREEN_WIDTH/2,
                                                          height: 20))
        dynamicLabel.backgroundColor = UIColor.orange
        dynamicLabel.textColor = UIColor.black
        dynamicLabel.textAlignment = NSTextAlignment.center
        dynamicLabel.font = dynamicLabel.font.withSize(12)
        dynamicLabel.text = textValue
        return dynamicLabel
    }
    
    func createImageView(_ imageName: String, cell: UICollectionViewCell) -> UIImageView {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame =  CGRect(x: 0,
                                 y: 10,
                                 width: SCREEN_SIZE.SCREEN_WIDTH/2,
                                 height: cell.frame.height - 45)
        imageView.contentMode = .scaleAspectFit

        return imageView
    }
    
}
