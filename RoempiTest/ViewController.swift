//
//  ViewController.swift
//  RoempiTest
//
//  Created by abdulrazak on 02/11/20.
//

import UIKit

struct Item {
    var imageName: String
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var items: [Item] = [Item(imageName:"1"),
                        Item(imageName: "2"),
                        Item(imageName: "4"),
                        Item(imageName: "5"),
                        Item(imageName: "6"),
                        Item(imageName: "7"),
                        Item(imageName: "8"),
                        Item(imageName: "9"),
                        Item(imageName: "10"),
                        Item(imageName: "11"),
    ]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "ItemCollectionViewCell"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setupCollectionViewItemSize()
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }

    private func setupCollectionViewItemSize(){
        if collectionViewFlowLayout == nil {
            let numberOfItemForRow: CGFloat = 3
            let lineSpacing: CGFloat = 5
            let interItemSpacing = 5
            
            let width = (collectionView.frame.width - (numberOfItemForRow - 1) * CGFloat(interItemSpacing)) / numberOfItemForRow
            
            let height = width
            collectionViewFlowLayout = UICollectionViewFlowLayout()
            
            collectionViewFlowLayout.itemSize = CGSize(width: width, height: height)
            collectionViewFlowLayout.sectionInset = UIEdgeInsets.zero
            collectionViewFlowLayout.scrollDirection = .vertical
            collectionViewFlowLayout.minimumLineSpacing = lineSpacing
            collectionViewFlowLayout.minimumInteritemSpacing = CGFloat(interItemSpacing)
            
            collectionView.setCollectionViewLayout(collectionViewFlowLayout, animated: true)
        }
        
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ItemCollectionViewCell
        cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("didselected: \(Item.init(imageName: ""))")
    }
}

