//
//  ViewController.swift
//  WaterfallFlowLayout
//
//  Created by Eric Cerney on 7/21/14.
//  Copyright (c) 2014 Eric Cerney. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, CollectionViewWaterfallLayoutDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    lazy var cellSizes: [CGSize] = {
        var _cellSizes = [CGSize]()
        
//        for _ in 0...1 {
//            let random = Int(arc4random_uniform((UInt32(100))))
            
//            _cellSizes.append(CGSize(width: 640, height: 360))
//            _cellSizes.append(CGSize(width: 640, height: 360))

            _cellSizes.append(CGSize(width: 640, height: 320))
            _cellSizes.append(CGSize(width: 320, height: 640))
            _cellSizes.append(CGSize(width: 320, height: 640))
            _cellSizes.append(CGSize(width: 320, height: 640))
            _cellSizes.append(CGSize(width: 640, height: 320))
            _cellSizes.append(CGSize(width: 640, height: 320))
            _cellSizes.append(CGSize(width: 320, height: 640))

        
//        }
        
        return _cellSizes
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let layout = CollectionViewWaterfallLayout()
//        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
//        layout.minimumColumnSpacing = 1
//        layout.minimumInteritemSpacing = 1
//        layout.columnCount = 5
//        
//        collectionView.collectionViewLayout = layout
        collectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: CollectionViewWaterfallElementKindSectionHeader, withReuseIdentifier: "Header")
        collectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: CollectionViewWaterfallElementKindSectionFooter, withReuseIdentifier: "Footer")
    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellSizes.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath)
        
        if let label = cell.contentView.viewWithTag(1) as? UILabel {
            label.text = String(indexPath.row)
        }
        return cell
    }
    
//    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
//        var reusableView: UICollectionReusableView? = nil
//        
//        if kind == CollectionViewWaterfallElementKindSectionHeader {
//            reusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "Header", forIndexPath: indexPath)
//            
//            if let view = reusableView {
//                view.backgroundColor = UIColor.redColor()
//            }
//        }
//        else if kind == CollectionViewWaterfallElementKindSectionFooter {
//            reusableView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "Footer", forIndexPath: indexPath)
//            if let view = reusableView {
//                view.backgroundColor = UIColor.blueColor()
//            }
//        }
//        
//        return reusableView!
//    }
    
    // MARK: WaterfallLayoutDelegate
    
    func collectionView(collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return cellSizes[indexPath.item]
    }
}


extension ViewController {
  override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {

    if #available(iOS 8.0, *) {
        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    } else {

    }
    
    coordinator.animateAlongsideTransition( { (UIViewControllerTransitionCoordinatorContext) -> Void in},
      completion: { (UIViewControllerTransitionCoordinatorContext ctx) -> Void in
      
        
        let layout = CollectionViewWaterfallLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumColumnSpacing = 1
        layout.minimumInteritemSpacing = 1
        
        
        if size.width / size.height > 1 {
            layout.columnCount = 5
        } else {
            layout.columnCount = 3
        }
        


        self.collectionView?.setCollectionViewLayout(layout, animated: true)
    });
  }
}


