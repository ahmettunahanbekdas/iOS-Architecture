//
//  ViewController.swift
//  MovieBox
//
//  Created by Ahmet Tunahan Bekdaş on 26.08.2024.
//

import UIKit
import MovieBoxAPI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MovieBoxAPIClient.testRun()
     MovieBoxAPIClient.testAlamofire()
    }
}



