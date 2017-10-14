//
//  Created by acecilia on 10/14/2017.
//  Copyright (c) 2017 acecilia. All rights reserved.
//

import UIKit
import NestLayout
import SugarEdges

class ViewController: UIViewController {
    var notFixed: UIView {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.borderWidth = 2
        return view
    }
    
    var hFixed: UIView {
        let view = notFixed
        view.heightAnchor.constraint(equalToConstant: CGFloat(50 + arc4random_uniform(10)*5)).isActive = true
        view.backgroundColor = .red
        return view
    }
    
    var wFixed: UIView {
        let view = notFixed
        view.widthAnchor.constraint(equalToConstant: CGFloat(30 + arc4random_uniform(10)*5)).isActive = true
        view.backgroundColor = .yellow
        return view
    }
    
    var hwFixed: UIView {
        let view = hFixed
        view.widthAnchor.constraint(equalToConstant: CGFloat(30 + arc4random_uniform(10)*5)).isActive = true
        view.backgroundColor = .orange
        return view
    }
    
    var label: UILabel {
        let label = UILabel()
        label.backgroundColor = UIColor.cyan
        label.textColor = .brown
        label.text = "This is text :)"
        return label
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scrollView = UIScrollView()
        scrollView.snapEdges(in: view, topLayoutGuide: topLayoutGuide)
        
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.snapEdges(in: scrollView)
        view.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        
        UIStackView(hFixed, axis: .vertical, spacing: 10)
            .nest(label, alignment: .center)
            .nest(hFixed, margins: [.left + .right : 10, .top + .bottom : 20])
            .nest(hwFixed, hFixed, hwFixed, axis: .horizontal, alignment: .top)
            .nest(hFixed, hFixed, axis: .horizontal, distribution: .fillEqually, alignment: .top)
            .nest(hFixed, notFixed, notFixed, axis: .horizontal, distribution: .fillEqually)
            .nest(hFixed, wFixed, axis: .horizontal)
            .nest(alignment: .center) {
                $0.nest(hwFixed, hwFixed, axis: .horizontal, alignment: .top)
            }
            .nest(hwFixed, hwFixed, spacing: 30)
            .nest(hFixed, margins: [.top + .left : 10])
            .nest(hFixed)
            .snapEdges(in: contentView)
    }
}

