require 'test_helper'

class MusicTest < ActiveSupport::TestCase
  def setup
    @mozart = Composer.new :full_name => 'Wolfgang Amadeus Mozart', :short_name =>
      'Mozart', :date_born => '2012-01-01', :date_died => '2012-01-02'
    @mozart.update_slug
    @mozart.save!
    @bach = Composer.new :full_name => 'Johann Sebastian Bach', :short_name =>
      'Bach', :date_born => '2012-01-01', :date_died => '2012-01-02'
    @bach.update_slug
    @bach.save!
  end

  test "can save and fetch valid music" do
    c = Music.new :full_name => 'Requiem in D minor'
    c.composer = @mozart
    c.update_slug
    c.save!
    Music.find_by(slug: c.slug)
  end

  test "can save and fetch music with all attributes" do
    m = Music.new :full_name => 'Requiem in D minor', :english_name => 'English Requiem',
      :description => "D", :date_written_start => '2012-01-01',
      :date_written_end => '2012-01-02'
    m.composer = @mozart
    m.update_slug
    m.save!
    d = Music.find_by(slug: m.slug)
    assert_equal 'Requiem in D minor', d.full_name
    assert_equal 'mozart-english-requiem', d.slug
    assert_equal 'English Requiem', d.english_name
    assert_equal 'D', d.description
    assert_equal Date.new(2012,01,01), d.date_written_start
    assert_equal Date.new(2012,01,02), d.date_written_end
  end

  test "cannot update protected music attributes" do
    m = Music.new
    m.slug = 'qwerty'
    m.update_attributes(:slug => 'asdf')
    assert_equal 'qwerty', m.slug
  end

  test "slug generation uses the correct source" do
    c = Music.new :full_name => 'a full name'
    c.composer = @mozart
    c.update_slug
    assert_equal 'mozart-a-full-name', c.slug
    c = Music.new :full_name => 'a full name', :english_name => 'english name'
    c.composer = @mozart
    c.update_slug
    assert_equal 'mozart-english-name', c.slug
  end

  test "slug used for url parameter generation" do
    m = Music.new
    m.slug = 'asdf'
    assert_equal 'asdf', m.to_param
  end

  test "music required fields" do
    m = Music.new

    # full name
    m.slug = "asdasdf"
    assert_raise Mongoid::Errors::Validations do
      m.save!
    end
    m.slug = nil

    # slug
    m.full_name = "asdasdf"
    assert_raise Mongoid::Errors::Validations do
      m.save!
    end
  end

  test "music field minimum lengths" do
    c = Music.new
    c.composer = @mozart

    # full name
    c.slug = "asdasdf"
    c.full_name = 'as'
    assert_raise Mongoid::Errors::Validations do
      c.save!
    end
    c.slug = nil

    # slug
    c.slug = "as"
    c.full_name = "asdasdf"
    assert_raise Mongoid::Errors::Validations do
      c.save!
    end

    # english name
    c.slug = "asdfasdf"
    c.full_name = "asdfasdf"
    c.english_name = "as"
    assert_raise Mongoid::Errors::Validations do
      c.save!
    end

    # all with proper length
    c.slug = "asdfasdf"
    c.full_name = "asdfasdf"
    c.english_name = "asdfasdf"
    assert c.save
  end

  test "music slug must be unique" do
    c = Music.new :full_name => 'Requiem'
    c.composer = @mozart
    c.slug = 'aaa'
    c.save!

    # same case
    d = Music.new :full_name => 'Sonata'
    d.composer = @mozart
    d.slug = 'aaa'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end

    # different case
    d = Music.new :full_name => 'Sonata'
    d.composer = @mozart
    d.slug = 'Aaa'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end
  end

  test "music full name must be unique" do
    c = Music.new :full_name => 'Requiem'
    c.composer = @mozart
    c.slug = 'aaa'
    c.save!

    # same case
    d = Music.new :full_name => 'Requiem'
    d.composer = @mozart
    d.slug = 'bbb'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end

    # different case
    d = Music.new :full_name => 'rEquiem'
    d.composer = @mozart
    d.slug = 'bbb'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end
  end

  test "music english name must be unique" do
    c = Music.new :full_name => 'Requiem', :english_name => 'Requiem'
    c.composer = @mozart
    c.slug = 'aaa'
    c.save!

    # same case
    d = Music.new :full_name => 'Sonata', :english_name => 'Requiem'
    d.composer = @mozart
    d.slug = 'bbb'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end

    # different case
    d = Music.new :full_name => 'Sonata', :english_name => 'rEquiem'
    d.composer = @mozart
    d.slug = 'bbb'
    assert_raise Mongoid::Errors::Validations do
      d.save!
    end
  end
end
