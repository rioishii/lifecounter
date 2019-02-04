//
//  historyViewController.swift
//  lifecounter
//
//  Created by Rio Ishii on 2/3/19.
//  Copyright © 2019 Rio Ishii. All rights reserved.
//

import UIKit

class historyViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !history.isEmpty {
            for index in 0...history.count - 1 {
            let label = UILabel(frame: CGRect(x: 50, y: index * 25 + 50, width: 300, height: 40))
                label.text = history[index]
                //view.addSubview(label)
                scrollview.addSubview(label)
            }
        }
    }
    
    @IBOutlet weak var scrollview: UIScrollView!
    var history: [String] = []

}
