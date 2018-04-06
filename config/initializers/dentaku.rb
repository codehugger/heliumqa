EPSILON = 0.001

# REGEX
Dentaku::AST::Function.register(:regex, :string, ->(value, matcher) {
  (/#{matcher}/i).match?(value)
})

# BEGINSWITH
Dentaku::AST::Function.register(:regex, :string, ->(value, matcher) {
  value.begin_with?(matcher)
})

# ENDSWITH
Dentaku::AST::Function.register(:regex, :string, ->(value, matcher) {
  value.end_with?(matcher)
})

# RANGE
Dentaku::AST::Function.register(:range, :numeric, ->(value, a, b) {
  (a..b).include?(value)
})

# EPSILON
Dentaku::AST::Function.register(:epsilon, :numeric, ->(value, a) {
  ((a - EPSILON)..(a + EPSILON)).include?(value)
})

# ARRAYEQUALS
Dentaku::AST::Function.register(:arrayequals, :string, ->(value, *args) {
  value_array = value.split("//")
  return false if value_array.count != args.count
  args.each_with_index.all? { |x, i| value_array[i].to_s == x.to_s }
})

# ARRAYEPSILON
Dentaku::AST::Function.register(:arrayepsilon, :string, ->(value, *args) {
  value_array = value.split("\\")
  return false if value_array.count != args.count
  args.each_with_index.all? { |x, i| ((a - EPSILON)..(a + EPSILON)).include?(value) }
})
