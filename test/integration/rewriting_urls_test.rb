require 'test_helper'

class RewritingUrlsTest < ActionDispatch::IntegrationTest
  test "rewriting urls should work routes" do
    get '/composers/'
    assert_redirected_to composers_path

    get '/composers/mozart/'
    assert_redirected_to '/composers/mozart'
  end
end
