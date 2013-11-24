require 'test_helper'
 
class FavoritesControllerTest < ActionController::TestCase
  test "index defaults to html" do
    get :index
    assert_response :success
    assert_select "h1", 1
    assert_select ".content-list", 0
    assert_select "title", { :count=>1, :text=>"Denver Favorites" }
  end
  
  test "index json sane" do
    get :index, :format => :json
    assert_response :success
    json = ActiveSupport::JSON.decode response.body
    assert_equal json.length, 6
  end

  test "default show gives the html index" do
    get :show, :id => 'kaos'
    assert_response :success
    assert_select "h1", 1
    assert_select ".content-list", 0
    assert_select "title", { :count=>1, :text=>"Denver Favorites" }
  end  

  test "get a json with show" do
    get :show, :format => :json, :id => 'kaos'
    assert_response :success
    json = ActiveSupport::JSON.decode response.body
    assert_equal json['name'], 'Kaos Pizzeria'
  end    
end
