require 'test_helper'

class CurrentBindingsTest < BaseTest
  test 'first binding returned is the current one' do
    assert_equal __LINE__, Bindex.current_bindings.first.eval('__LINE__')
  end
end
