require 'test_helper'

class ComposersControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:composers)
  end

  test "should create composer" do
    assert_difference 'Composer.count' do
      post :create, :composer => { :full_name => 'Mozart' }
    end
    assert_redirected_to composer_path(assigns(:composer))
    assert_equal 'Composer Mozart was successfully created.', flash[:notice]
  end

  test "should show composer" do
    c = Composer.new(:full_name => 'Mozart')
    c.update_slug
    c.save!

    get :show, :id => 'mozart'
    assert_select 'h1', 'Mozart'
  end
end
