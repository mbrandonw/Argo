/**
  Remove `Failure` values from an array and unwrap `Success`es.

  This will iterate through the array of `Decoded<T>` elements and safely
  unwrap the values.

  If the element is `.Success(T)`, it will unwrap the value and add it into the
  array.

  If the element is `.Failure`, it will remove it from the array.

  - parameter xs: An array of `Decoded<T>` values
  - returns: An array of unwrapped values of type `T`
*/
public func catDecoded<T>(xs: [Decoded<T>]) -> [T] {
  var accum: [T] = []
  accum.reserveCapacity(xs.count)

  for x in xs {
    switch x {
    case let .Success(value): accum.append(value)
    case .Failure: continue
    }
  }

  return accum
}

/**
  Remove `Failure` values from a Dictionary and unwrap `Success`es.

  This will iterate through the dictionary of `Decoded<T>` elements and safely
  unwrap the values.

  If the element is `.Success(T)`, it will unwrap the value and assign it to
  the existing key in the new dictionary.

  If the element is `.Failure`, it will remove it from the dictionary.

  - parameter xs: A dictionary of `Decoded<T>` values assigned to `String` keys
  - returns: A dictionary of unwrapped values of type `T` assigned to `String` keys
*/
public func catDecoded<T>(xs: [String: Decoded<T>]) -> [String: T] {
  var accum = Dictionary<String, T>(minimumCapacity: xs.count)

  for (key, x) in xs {
    switch x {
    case let .Success(value): accum[key] = value
    case .Failure: continue
    }
  }

  return accum
}
