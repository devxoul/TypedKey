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

    public func registerClass<T: TypedKey where T.KeyType == String>
    (cellClass: AnyClass?, forCellWithReuseIdentifier identifier: T) {
        self.registerClass(cellClass, forCellWithReuseIdentifier: identifier.key)
    }

    public func registerNib<T: TypedKey where T.KeyType == String>
    (nib: UINib?, forCellWithReuseIdentifier identifier: T) {
        self.registerNib(nib, forCellWithReuseIdentifier: identifier.key)
    }

    public func registerClass<T: TypedKey where T.KeyType == String>
    (viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: T) {
        self.registerClass(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier.key)
    }

    public func registerNib<T: TypedKey where T.KeyType == String>
    (nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: T) {
        self.registerNib(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier.key)
    }

    public func dequeueReusableCellWithReuseIdentifier<T: TypedKey where T.KeyType == String>
    (identifier: T, forIndexPath indexPath: NSIndexPath) -> T.ValueType {
        return self.dequeueReusableCellWithReuseIdentifier(identifier.key, forIndexPath: indexPath) as! T.ValueType
    }

    public func dequeueReusableSupplementaryViewOfKind<T: TypedKey where T.KeyType == String>
    (elementKind: String, withReuseIdentifier identifier: T, forIndexPath indexPath: NSIndexPath) -> T.ValueType {
        return dequeueReusableSupplementaryViewOfKind(elementKind, withReuseIdentifier: identifier.key,
            forIndexPath: indexPath) as! T.ValueType
    }

}

#endif
