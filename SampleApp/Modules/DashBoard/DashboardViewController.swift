//
//  DashboardViewController.swift
//  SampleApp
//
//  Created by Shekhar Gupta on 03/01/20.
//  Copyright © 2020 Shekhar Gupta. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var tableview: UITableView!
    @IBOutlet var scrollView: UIScrollView!
    
    var model = dataArray as Array<AnyObject>
    var storedOffsets = [Int: CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
    }
    
    func configureUI() {
        self.navigationItem.title = "UE DEMO"
        self.configureNavigationBar()
        self.addBackButton()
        self.configureScrollView()
    }
    
    func configureNavigationBar() {
        let burgerMenuIcon = UIButton(type: .custom)
        burgerMenuIcon.setImage(UIImage(named: "burgerMenu"), for: .normal)
        burgerMenuIcon.addTarget(self, action: #selector(self.showSlideMenu), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: burgerMenuIcon)
    }
    
    func addBackButton() {
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(named: "burgerMenu.png"), for: .normal)
        backButton.setTitleColor(backButton.tintColor, for: .normal)
        backButton.addTarget(self, action: #selector(self.showSlideMenu), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: backButton)
    }
    
    func configureScrollView() {
        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * 2,
                                             height: self.scrollView.frame.size.height)
    }
        
    //MARK:- User Action
    @IBAction func backAction(_ sender: UIButton) {
       let _ = self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showSlideMenu() {
        slideMenuController()?.openLeft()
    }
    
    @IBAction func showDetailView() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailedViewController")
        self.navigationController?.push(vc, animated: true)
    }
    

}

extension DashboardViewController:  UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return SCREEN_SIZE.SCREEN_HEIGHT / 5.6
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? TableViewCell else { return }
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }

    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let tableViewCell = cell as? TableViewCell else { return }
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }}



extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model[collectionView.tag].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        let collectionViewArray = model[collectionView.tag] as! Array<AnyObject>
        let rowData: Dictionary<String, String> = collectionViewArray[indexPath.row] as! Dictionary<String, String>
        
        if let labelValue = rowData["label"] {
            cell.addSubview(self.createLabel(labelValue, cell: cell))
        }

        if let imageName = rowData["image"] {
            cell.addSubview(self.createImageView(imageName, cell: cell))
        }

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
        self.manageNavigation(collectionView.tag, index: indexPath.row)
    }
    
    func createLabel(_ textValue: String, cell: UICollectionViewCell) -> UILabel {
        let dynamicLabel: UILabel = UILabel(frame: CGRect(x: 0,
                                                          y: cell.frame.height - 35,
                                                          width: SCREEN_SIZE.SCREEN_WIDTH/2,
                                                          height: 20))
        dynamicLabel.textColor = .systemBlue
        dynamicLabel.textAlignment = NSTextAlignment.center
        dynamicLabel.font = dynamicLabel.font.withSize(14)
        dynamicLabel.text = textValue
        return dynamicLabel
    }
    
    func createImageView(_ imageName: String, cell: UICollectionViewCell) -> UIImageView {
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image)
        imageView.frame =  CGRect(x: 0,
                                 y: 30,
                                 width: SCREEN_SIZE.SCREEN_WIDTH/2,
                                 height: cell.frame.height - 80)
        imageView.contentMode = .scaleAspectFit

        return imageView
    }
    
}

extension DashboardViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: SCREEN_SIZE.SCREEN_WIDTH/2,
                      height: SCREEN_SIZE.SCREEN_HEIGHT/5.6)
    }
}


extension DashboardViewController {
    func manageNavigation(_ row: Int, index:Int) {
        switch row {
        case 0:
            self.handleTransactions(index)
        case 1:
            self.handleBillPayament(index)
        case 2:
            self.handleBooking(index)
        case 3:
            self.handleProfile(index)
        default:
            break
        }

    }
    
    func handleTransactions(_ index: Int) {
        switch index {
        case 0:
            print("pay to merchant")
            self.navigateToViewController(vc: "PayToMerchantViewController")
            break
        case 1:
            print("send Money")
            fatalError()
            break
        default:
            break
        }
    }
    
    func handleBillPayament(_ index: Int) {
        switch index {
        case 0:
            print("Mobile topup")
            break
        case 1:
            print("Mobile Bill payment")
            break
        case 2:
            print("Electricity Bill payment")
            break
        default:
            break
        }
    }
    
    func handleBooking(_ index: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ComingSoonViewController") as! ComingSoonViewController
        switch index {
        case 0:
            print("Hotel")
            vc.selectedView = SelectedItem.hotel.rawValue
            break
        case 1:
            print("cab")
            vc.selectedView = SelectedItem.cab.rawValue
            break
        case 2:
            print("flight")
            vc.selectedView = SelectedItem.flight.rawValue
            break
        case 3:
            print("train")
            vc.selectedView = SelectedItem.train.rawValue
            break
        case 4:
            print("Bus")
            vc.selectedView = SelectedItem.bus.rawValue
            break
        case 5:
            print("Movie")
            break
        case 6:
            print("Sports")
            break
        default:
            return
        }
        if vc.selectedView != "" {
            self.navigationController?.push(vc, animated: true)
        }
    }
    
    func handleProfile(_ index: Int) {
        switch index {
        case 0:
            print("Profile Seeting")
            break
        case 1:
            print("Tab Activity")
            self.navigateToViewController(vc: "TabViewController")
            break
        default:
            break
        }
    }
        
    func navigateToViewController(vc: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: vc)
        self.navigationController?.push(vc, animated: true)
    }
}

