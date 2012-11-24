require 'test_helper'
require 'helper_library'

class MusLibTest < ActiveSupport::TestCase
  test "slug generation removes bad characters" do
    slug = HelperLibrary.generate_slug '1B2uffy the-vAMPire _slayer!'
    assert_equal '1b2uffy-the-vampire-_slayer', slug
  end
end
