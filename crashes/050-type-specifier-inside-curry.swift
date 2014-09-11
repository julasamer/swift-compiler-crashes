func prefix(with: String) -> <T>(() -> T) -> String {
  return { g in "\(with): \(g())" }
}
