//
//  CharacterListTableViewDelegate.swift
//  RickAndMorty
//
//  Created by Edgar Guitian Rey on 11/12/23.
//

import Foundation
import UIKit

class CharacterListTableViewDelegate: NSObject, UITableViewDelegate {
    var didTapOnCell: ((Int) -> Void)?

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapOnCell?(indexPath.row)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}
