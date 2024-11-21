//
//  MovieCollectionViewCell.swift
//  CollectionViewDemo
//
//  Created by Sowmya potu on 11/19/24.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var imageViewOL: UIImageView!
    func assignMovie(with movie:MovieSwift)
    {
        imageViewOL.image=movie.image
    }
    
    
}
