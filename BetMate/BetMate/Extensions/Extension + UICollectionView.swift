//
//  Extension + UICollectionView.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 20.05.2023.
//

import Foundation
import UIKit

extension UICollectionView {
    func sportSectionLayout() -> NSCollectionLayoutSection? {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                          heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: size)
        let itemSpacing: CGFloat = 10
        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(70),
                                               heightDimension: .absolute(70))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = itemSpacing
        section.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                        leading: 20,
                                                        bottom: 0,
                                                        trailing: 10)
        section.orthogonalScrollingBehavior = .continuous
        return section
    }
}
