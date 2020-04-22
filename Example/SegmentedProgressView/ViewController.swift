//
//  ViewController.swift
//  SegmentedProgressView
//
//  Created by dylanpowers25 on 04/21/2020.
//  Copyright (c) 2020 dylanpowers25. All rights reserved.
//

import UIKit
import SegmentedProgressView
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let defaultColorsLabel: UILabel = UILabel()
        defaultColorsLabel.text = "Default colors"
        let defaultSPView = SegmentedProgressView(numTotalSegments: 10, numFilledSegments: 3, totalViewWidth: 300)
        
        let customColorsLabel: UILabel = UILabel()
        customColorsLabel.text = "Specifying custom colors"
        let customSPView = SegmentedProgressView(numTotalSegments: 10, numFilledSegments: 3, totalViewWidth: 300, fillColor: .yellow, noFillColor: .blue)
        
        self.view.addSubview(defaultColorsLabel)
        self.view.addSubview(defaultSPView)
        self.view.addSubview(customColorsLabel)
        self.view.addSubview(customSPView)
        
        defaultSPView.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-100)
        }
        
        customSPView.snp.makeConstraints { (make) -> Void in
            make.centerX.equalToSuperview()
            make.top.equalTo(defaultSPView.snp.bottom).offset(100)
        }
        
        defaultColorsLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(defaultSPView.snp.top).offset(-15)
            make.left.equalTo(defaultSPView.snp.left)
        }
        
        customColorsLabel.snp.makeConstraints { (make) -> Void in
            make.bottom.equalTo(customSPView.snp.top).offset(-15)
            make.left.equalTo(customSPView.snp.left)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

