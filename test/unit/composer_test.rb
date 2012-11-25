require 'test_helper'

class ComposerTest < ActiveSupport::TestCase
  test "can save and fetch valid composer" do
    c = Composer.new :full_name => 'Wolfgang Amadeus Mozart'
    c.update_slug
    c.save!
    Composer.find_by(slug: c.slug)
  end

  test "slug generation uses the correct source" do
    c = Composer.new :full_name => 'a full name'
    c.update_slug
    assert_equal 'a-full-name', c.slug
    c = Composer.new :full_name => 'a full name', :short_name => 'sho rty'
    c.update_slug
    assert_equal 'sho-rty', c.slug
    c = Composer.new :full_name => 'a full name', :english_name => 'english name'
    c.update_slug
    assert_equal 'english-name', c.slug
  end

  test "slug used for url parameter generation" do
    c = Composer.new
    c.slug = 'asdf'
    assert_equal 'asdf', c.to_param
  end

  test "composer required fields" do
    c = Composer.new

    # english name
    c.slug = "asdasdf"
    assert_raise Mongoid::Errors::Validations do
      c.save!
    end
    c.slug = nil

    # slug
    c.full_name = "asdasdf"
    assert_raise Mongoid::Errors::Validations do
      c.save!
    end
  end

  test "composer field minimum lengths" do
    c = Composer.new

    # english name
    c.slug = "asdasdf"
    c.english_name = 'as'
    assert_raise Mongoid::Errors::Validations do
      c.save!
    end
    c.slug = nil

    # slug
    c.slug = "as"
    c.english_name = "asdasdf"
    assert_raise Mongoid::Errors::Validations do
      c.save!
    end
  end

  test "composer slug must be unique" do
    c = Composer.new :full_name => 'Mozart'
    c.slug = 'aaa'
    c.save!

    # same case
    d = Composer.new :full_name => 'Bach'
    d.slug = 'aaa'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end

    # different case
    d = Composer.new :full_name => 'Bach'
    d.slug = 'Aaa'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end
  end

  test "composer full name must be unique" do
    c = Composer.new :full_name => 'Mozart'
    c.slug = 'aaa'
    c.save!

    # same case
    d = Composer.new :full_name => 'Mozart'
    d.slug = 'bbb'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end

    # different case
    d = Composer.new :full_name => 'mOzart'
    d.slug = 'bbb'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end
  end

  test "composer english name must be unique" do
    c = Composer.new :full_name => 'Mozart', :english_name => 'Mozart'
    c.slug = 'aaa'
    c.save!

    # same case
    d = Composer.new :full_name => 'Bach', :english_name => 'Mozart'
    d.slug = 'bbb'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end

    # different case
    d = Composer.new :full_name => 'Bach', :english_name => 'mOzart'
    d.slug = 'bbb'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end
  end

  test "composer short name must be unique" do
    c = Composer.new :full_name => 'Mozart', :short_name => 'Mo'
    c.slug = 'aaa'
    c.save!

    # same case
    d = Composer.new :full_name => 'Bach', :short_name => 'Mo'
    d.slug = 'bbb'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end

    # different case
    d = Composer.new :full_name => 'Bach', :short_name => 'mo'
    d.slug = 'bbb'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end
  end

end
