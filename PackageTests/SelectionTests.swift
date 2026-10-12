import XCTest
import UIKit
@testable import MultiSelectSegmentedControl

@MainActor
final class SelectionTests: XCTestCase {
    func testMultipleSelectionAndTitles() {
        let control = MultiSelectSegmentedControl(items: ["One", "Two", "Three"])
        control.selectedSegmentIndexes = [0, 2]
        XCTAssertEqual(control.selectedSegmentIndexes, [0, 2])
        XCTAssertEqual(control.selectedSegmentTitles, ["One", "Three"])
        control.selectAllSegments(false)
        XCTAssertTrue(control.selectedSegmentIndexes.isEmpty)
    }

    func testSingleSelectionAndSegmentRemoval() {
        let control = MultiSelectSegmentedControl(items: ["One", "Two", "Three"])
        control.selectedSegmentIndexes = [0, 2]
        control.allowsMultipleSelection = false
        XCTAssertEqual(control.selectedSegmentIndexes, [0])
        control.selectedSegmentIndex = 2
        control.removeSegment(at: 2, animated: false)
        XCTAssertEqual(control.numberOfSegments, 2)
        XCTAssertTrue(control.selectedSegmentIndexes.isEmpty)
        control.removeAllSegments()
        XCTAssertEqual(control.numberOfSegments, 0)
    }

    func testMixedImageAndTextContents() {
        let image = UIImage(systemName: "checkmark")!
        let control = MultiSelectSegmentedControl(items: [[image, "Done"], "Later"])
        XCTAssertEqual(control.numberOfSegments, 2)
        XCTAssertEqual(control.titleForSegment(at: 0), "Done")
        XCTAssertEqual(control.imageForSegment(at: 0), image)
        control.setTitle("Updated", forSegmentAt: 0)
        XCTAssertEqual(control.titleForSegment(at: 0), "Updated")
    }
}
