assert value.odd?, 'value is not odd'
assert_equal 'XYZ', value.downcase
assert_equal nil, value
assert_nil value
assert_empty list
assert_includes list, 'xyz'
assert_raises NoExperienceError do
  employee.hire
end

assert_instance_of Numeric, value
assert_kind_of Numeric, value
assert_same list, list.process

refute_includes list, 'xyz'

