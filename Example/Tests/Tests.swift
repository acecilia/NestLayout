import UIKit
import XCTest
import NestLayout

class Tests: XCTestCase {
    
    func verticalEdgesInitTest() {
        var edges: Set<LayoutGuideEdge> = []
        let layoutSupport = UIViewController().topLayoutGuide
        
        if #available(iOS 11.0, *) {
            edges = .top + .bottom
        } else {
            edges = .topGuide(layoutSupport) + .bottomGuide(layoutSupport)
        }
        
        XCTAssertEqual(edges.count, 2)
    }

}
