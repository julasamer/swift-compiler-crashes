// Test case submitted to project by https://github.com/rnapier (Rob Napier)

func prefix(with: String) -> <T>(() -> T) -> String {
  return { g in "\(with): \(g())" }
}
