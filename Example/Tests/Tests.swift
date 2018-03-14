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
    
    func testEquality() {
        let vc = UIViewController()
        
        XCTAssertEqual(LayoutGuideEdge.top, LayoutGuideEdge.top)
        XCTAssertEqual(LayoutGuideEdge.topGuide(vc), LayoutGuideEdge.topGuide(vc))
        XCTAssertEqual(LayoutGuideEdge.top, LayoutGuideEdge.topGuide(vc))
        XCTAssertEqual(LayoutGuideEdge.topGuide(vc), LayoutGuideEdge.top)
        
        XCTAssertEqual(LayoutGuideEdge.bottom, LayoutGuideEdge.bottom)
        XCTAssertEqual(LayoutGuideEdge.bottomGuide(vc), LayoutGuideEdge.bottomGuide(vc))
        XCTAssertEqual(LayoutGuideEdge.bottom, LayoutGuideEdge.bottomGuide(vc))
        XCTAssertEqual(LayoutGuideEdge.bottomGuide(vc), LayoutGuideEdge.bottom)
        
        XCTAssertEqual(LayoutGuideEdge.left, LayoutGuideEdge.left)

        XCTAssertEqual(LayoutGuideEdge.right, LayoutGuideEdge.right)
        
        XCTAssertNotEqual(LayoutGuideEdge.left, LayoutGuideEdge.top)
        XCTAssertNotEqual(LayoutGuideEdge.left, LayoutGuideEdge.right)
        XCTAssertNotEqual(LayoutGuideEdge.left, LayoutGuideEdge.bottom)
        XCTAssertNotEqual(LayoutGuideEdge.left, LayoutGuideEdge.topGuide(vc))
    }

}
