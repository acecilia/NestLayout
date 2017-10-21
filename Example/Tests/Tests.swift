import UIKit
import XCTest
import NestLayout

class Tests: XCTestCase {
    
    func testVerticalEdgesInit() {
        var edges: Set<LayoutGuideEdge> = []
        
        if #available(iOS 11.0, *) {
            edges = .top + .bottom
        } else {
            let vc = UIViewController()
            let topLayoutGuide = vc.topLayoutGuide
            let bottomLayoutGuide = vc.bottomLayoutGuide
            edges = .topGuide(topLayoutGuide) + .bottomGuide(bottomLayoutGuide)
        }
        
        XCTAssertEqual(edges.count, 2)
    }

}
