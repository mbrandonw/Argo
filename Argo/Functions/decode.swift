// MARK: decode root objects and arrays

public func decode<T: Decodable where T == T.DecodedType>(object: AnyObject) -> Decoded<T> {
  return T.decode(JSON.parse(object))
}

public func decode<T: Decodable where T == T.DecodedType>(object: AnyObject) -> Decoded<[T]> {
  return Array<T>.decode(JSON.parse(object))
}

public func decode<T: Decodable where T == T.DecodedType>(object: AnyObject) -> T? {
  return decode(object).value
}

public func decode<T: Decodable where T == T.DecodedType>(object: AnyObject) -> [T]? {
  return decode(object).value
}

// MARK: decode with a root key

public func decode<T: Decodable where T == T.DecodedType>(object: AnyObject, rootKey: String) -> Decoded<T> {
  return JSON.parse(object) <| rootKey
}

public func decode<T: Decodable where T == T.DecodedType>(object: AnyObject, rootKey: String) -> Decoded<[T]> {
  return JSON.parse(object) <|| rootKey
}

public func decode<T: Decodable where T == T.DecodedType>(object: AnyObject, rootKey: String) -> T? {
  return decode(object, rootKey: rootKey).value
}

public func decode<T: Decodable where T == T.DecodedType>(object: String, rootKey: String) -> [T]? {
  return decode(object, rootKey: rootKey).value
}
