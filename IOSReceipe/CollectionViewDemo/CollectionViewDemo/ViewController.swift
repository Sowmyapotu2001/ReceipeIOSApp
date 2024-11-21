//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Sowmya potu on 11/19/24.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //create cell
        let cell=collectionViewOL.dequeueReusableCell(withReuseIdentifier: "reusableMovieCell", for:indexPath) as! MovieCollectionViewCell
        //populate the cell
        
        cell.assignMovie(with: movies[indexPath.row])
        //return cell
        return cell
    }
    
    //using this to select diplay the movies
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        assignMovieDetails(index: indexPath)
    }

    func assignMovieDetails(index:IndexPath)
    {
        TitleOL.text="Movie Title : \(movies[index.row].title)"
        YearOL.text="year : \(movies[index.row].releasedYear)"
        MRatingOL.text="Movie Rating:\(movies[index.row].movieRating)"
        BOfficeOL.text="BoxOfiice : \(movies[index.row].boxOffice)"
    }
    
    @IBOutlet weak var collectionViewOL: UICollectionView!
    
    
    @IBOutlet weak var TitleOL: UILabel!
    
    
    @IBOutlet weak var YearOL: UILabel!
    
    
    @IBOutlet weak var MRatingOL: UILabel!
    
    
    @IBOutlet weak var BOfficeOL: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        collectionViewOL.delegate=self
        collectionViewOL.dataSource=self
        
    }


}

