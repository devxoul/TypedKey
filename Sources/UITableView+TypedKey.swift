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

import UIKit

extension UITableView {

    // MARK: Overloading methods

    public func registerNib<Key: TypedKey where Key.KeyType == String>
    (nib: UINib?, forCellReuseIdentifier identifier: Key) {
        self.registerNib(nib, forCellReuseIdentifier: identifier.key)
    }

    public func registerClass<Key: TypedKey where Key.KeyType == String>
    (cellClass: AnyClass?, forCellReuseIdentifier identifier: Key) {
        self.registerClass(cellClass, forCellReuseIdentifier: identifier.key)
    }

    public func registerNib<Key: TypedKey where Key.KeyType == String>
    (nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: Key) {
        self.registerNib(nib, forHeaderFooterViewReuseIdentifier: identifier.key)
    }

    public func registerClass<Key: TypedKey where Key.KeyType == String>
    (aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: Key) {
        self.registerClass(aClass, forHeaderFooterViewReuseIdentifier: identifier.key)
    }

    public func dequeueReusableCellWithIdentifier<Key: TypedKey where Key.KeyType == String>
    (identifier: Key) -> Key.ValueType? {
        return self.dequeueReusableCellWithIdentifier(identifier.key) as? Key.ValueType
    }

    public func dequeueReusableCellWithIdentifier<Key: TypedKey where Key.KeyType == String>
    (identifier: Key, forIndexPath indexPath: NSIndexPath) -> Key.ValueType {
        return self.dequeueReusableCellWithIdentifier(identifier.key, forIndexPath: indexPath) as! Key.ValueType
    }

    public func dequeueReusableHeaderFooterViewWithIdentifier<Key: TypedKey where Key.KeyType == String>
    (identifier: Key) -> Key.ValueType? {
        return self.dequeueReusableHeaderFooterViewWithIdentifier(identifier.key) as? Key.ValueType
    }


    // MARK: Convenience methods

    public func registerCell<Key: TypedKey where Key.KeyType == String, Key.ValueType: UITableViewCell>
    (identifier: Key) {
        self.registerClass(identifier.valueType, forCellReuseIdentifier: identifier)
    }

    public func registerHeaderFooterView<Key: TypedKey where Key.KeyType == String, Key.ValueType: UIView>
    (identifier: Key) {
        self.registerClass(identifier.valueType, forHeaderFooterViewReuseIdentifier: identifier)
    }

    public func dequeueCell<Key: TypedKey where Key.KeyType == String>(identifier: Key) -> Key.ValueType? {
        return self.dequeueReusableCellWithIdentifier(identifier)
    }

    public func dequeueHeaderFooterView<Key: TypedKey where Key.KeyType == String>(identifier: Key) -> Key.ValueType? {
        return self.dequeueReusableHeaderFooterViewWithIdentifier(identifier)
    }

}

#endif
