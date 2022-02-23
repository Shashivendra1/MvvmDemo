//
//  ViewController.swift
//  PhotoApp_MVVM
//
//  Created by shashivendra  on 03/02/22.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {

    var photoList = [PhotoViewModel]()
    var MetaList = [MetaViewModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        
        setupCollection()
        getData()
        
        // for collecttion view
        newCollection.register(nyrentalCollectionViewCell1.self, forCellWithReuseIdentifier: "MyCell")
        newCollection.delegate = self
        newCollection.dataSource = self
        
        
    }

    //MARK: Api func call
    func getData (){
        
       // Service.shareInstance.getAllMovieData { (list, error) in
        Service.shareInstance.getAllMovieData { (list, list12, error) in
            
                if error == nil {
              //  print(list)
             // print(list12)
                self.photoList = (list?.map({ return PhotoViewModel(data: $0) } ))!
                self.MetaList = (list12?.map({ return MetaViewModel(data12: $0) } ))!
                        
                DispatchQueue.main.async {
                    self.newCollection.reloadData()
                }
                
                
            }
            else {
                print(error?.localizedDescription)
            }
        }
    }
    
    
    
    //MARK: SetUp collectionview
    
    func setupCollection()    {
        view.addSubview(newCollection)
        newCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 5).isActive = true
        newCollection.widthAnchor.constraint(equalTo: view.widthAnchor,constant: -10).isActive = true
        newCollection.heightAnchor.constraint(equalTo:view.heightAnchor,constant: -10).isActive = true
    }
    
    
    // add collection
   let newCollection: UICollectionView =

   {
   let layout = UICollectionViewFlowLayout()

   let collection = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)

   layout.scrollDirection = .vertical

   collection.backgroundColor = UIColor.white

   collection.translatesAutoresizingMaskIntoConstraints = false

   collection.isScrollEnabled = true

   return collection

   }()



}



extension ViewController: UICollectionViewDataSource ,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoList.count
 
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let myCell = newCollection.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! nyrentalCollectionViewCell1
        
        let list_image = photoList[indexPath.row]
        myCell.imageView.sd_setImage(with: URL(string:list_image.fullImage), placeholderImage: UIImage(named: "umbagog"))
        
       // myCell.imageView.image = UIImage(named: "umbagog")
     

        return myCell
     
        return UICollectionViewCell()
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      let itemSize = (collectionView.frame.width - (collectionView.contentInset.left + collectionView.contentInset.right + 10)) / 2
      return CGSize(width: itemSize, height: 180)
            } // END layout func
    
    
}


