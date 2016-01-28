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

extension UICollectionView {

    public func registerClass<Key: TypedKey where Key.KeyType == String>
    (cellClass: AnyClass?, forCellWithReuseIdentifier identifier: Key) {
        self.registerClass(cellClass, forCellWithReuseIdentifier: identifier.key)
    }

    public func registerNib<Key: TypedKey where Key.KeyType == String>
    (nib: UINib?, forCellWithReuseIdentifier identifier: Key) {
        self.registerNib(nib, forCellWithReuseIdentifier: identifier.key)
    }

    public func registerClass<Key: TypedKey where Key.KeyType == String>
    (viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: Key) {
        self.registerClass(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier.key)
    }

    public func registerNib<Key: TypedKey where Key.KeyType == String>
    (nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: Key) {
        self.registerNib(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier.key)
    }

    public func dequeueReusableCellWithReuseIdentifier<Key: TypedKey where Key.KeyType == String>
    (identifier: Key, forIndexPath indexPath: NSIndexPath) -> Key.ValueType {
        return self.dequeueReusableCellWithReuseIdentifier(identifier.key, forIndexPath: indexPath) as! Key.ValueType
    }

    public func dequeueReusableSupplementaryViewOfKind<Key: TypedKey where Key.KeyType == String>
    (elementKind: String, withReuseIdentifier identifier: Key, forIndexPath indexPath: NSIndexPath) -> Key.ValueType {
        return dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: identifier.key,
            forIndexPath: indexPath) as! Key.ValueType
    }

}

#endif
