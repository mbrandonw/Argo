public func sequence<T>(xs: [Decoded<T>]) -> Decoded<[T]> {
  var accum: [T] = []
  accum.reserveCapacity(xs.count)

  for x in xs {
    switch x {
    case let .Success(value): accum.append(value)
    case let .Failure(error): return .Failure(error)
    }
  }

  return pure(accum)
}

public func sequence<Key, Value>(xs: [Key: Decoded<Value>]) -> Decoded<[Key: Value]> {
  var accum = Dictionary<Key, Value>(minimumCapacity: xs.count)

  for (key, x) in xs {
    switch x {
    case let .Success(value): accum[key] = value
    case let .Failure(error): return .Failure(error)
    }
  }

  return pure(accum)
}
