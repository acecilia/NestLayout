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
            edges = .topGuide(vc) + .bottomGuide(vc)
        }
        
        XCTAssertEqual(edges.count, 2)
    }

}
