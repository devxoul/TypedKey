// The MIT License (MIT)
//
// Copyright (c) 2016 Suyeol Jeon (xoul.kr)
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

#if os(iOS)

import XCTest
import TypedKey

class UITableViewTypedKeyTests: XCTestCase {

    var tableView: UITableView!

    override func setUp() {
        super.setUp()
        self.tableView = UITableView()
    }

    func testRegisterAndDequeueCell() {
        let userCellIdentifier = StringKey<UserCell>("userCell")
        XCTAssertNil(self.tableView.dequeueReusableCellWithIdentifier(userCellIdentifier))
        self.tableView.registerClass(UserCell.self, forCellReuseIdentifier: userCellIdentifier)
        XCTAssertNotNil(self.tableView.dequeueReusableCellWithIdentifier(userCellIdentifier))
    }

    func testRegisterAndDequeueHeaderFooterView() {
        let sectionHeaderView = StringKey<SectionHeaderView>("sectionHeaderView")
        XCTAssertNil(self.tableView.dequeueReusableHeaderFooterViewWithIdentifier(sectionHeaderView))
        self.tableView.registerClass(SectionHeaderView.self, forHeaderFooterViewReuseIdentifier: sectionHeaderView)
        XCTAssertNotNil(self.tableView.dequeueReusableHeaderFooterViewWithIdentifier(sectionHeaderView))
    }

    func testConvenienceRegisterAndDequeueCell() {
        let userCellIdentifier = StringKey<UserCell>("userCell")
        self.tableView.registerCell(userCellIdentifier)
        XCTAssertNotNil(self.tableView.dequeueCell(userCellIdentifier))
    }

    func testConvenienceRegisterAndDequeueHeaderFooterView() {
        let sectionHeaderView = StringKey<SectionHeaderView>("sectionHeaderView")
        self.tableView.registerHeaderFooterView(sectionHeaderView)
        XCTAssertNotNil(self.tableView.dequeueHeaderFooterView(sectionHeaderView))
    }

}

private class UserCell: UITableViewCell {}
private class SectionHeaderView: UITableViewHeaderFooterView {}

#endif
