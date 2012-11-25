require 'test_helper'

class MusicControllerTest < ActionController::TestCase
  def setup
    @mozart = Composer.new :full_name => 'Wolfgang Amadeus Mozart', :short_name =>
      'Mozart', :date_born => '2012-01-01', :date_died => '2012-01-02'
    @mozart.update_slug
    @mozart.save!
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:music)
  end

  test "should create music" do
    assert_difference 'Music.count' do
      post :create, :music => { :full_name => 'Requiem', :composer => 'mozart' }
    end
    assert_redirected_to music_path(assigns(:music))
    assert_equal 'Music work Requiem was successfully created.', flash[:notice]
  end

  test "should show music" do
    m = Music.new(:full_name => 'Requiem')
    m.composer = @mozart
    m.update_slug
    m.save!

    get :show, :id => 'mozart-requiem'
    assert_select 'h1', 'Requiem by Wolfgang Amadeus Mozart'
  end

  test "should update music" do
    m = Music.new(:full_name => 'Requiem')
    m.composer = @mozart
    m.update_slug
    m.save!

    put :update, :id => 'mozart-requiem', :music => { :full_name => 'Requiem', :composer => 'mozart', :description => 'Truman' }
    assert_redirected_to music_path(assigns(:music))
    m = Music.find_by(:slug => 'mozart-requiem')
    assert_equal m.full_name, 'Requiem'
    assert_equal m.description, 'Truman'
  end

  test "routes" do
    assert_routing '/music', { :controller => "music", :action => "index" }
    assert_routing '/music/new', { :controller => "music", :action => "new" }
    assert_routing '/music/mozart-requiem', { :controller => "music", :action => "show", :id => "mozart-requiem" }
    assert_routing '/music/mozart-requiem/edit', { :controller => "music", :action => "edit", :id => "mozart-requiem" }
  end
end
