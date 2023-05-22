//
//  GamesViewModel.swift
//  BetMate
//
//  Created by Evgeniy Docenko on 20.05.2023.
//

import Foundation
import UIKit

class GamesViewModel {
    // MARK: - Private properties
    var footballInfoArr: [FootballResponse] = []
    
    // MARK: - Get football info
    func getFootballInfo(completion: @escaping () -> Void) {
        FootballNtworkManager.shared.footballNetworkManager { result in
            self.footballInfoArr = result
            completion()
        }
    }
}
