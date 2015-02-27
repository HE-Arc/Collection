require 'test_helper'

class ItemCollectionsControllerTest < ActionController::TestCase
  setup do
    @item_collection = item_collections(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_collections)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_collection" do
    assert_difference('ItemCollection.count') do
      post :create, item_collection: { beginDate: @item_collection.beginDate, name: @item_collection.name, user_id: @item_collection.user_id }
    end

    assert_redirected_to item_collection_path(assigns(:item_collection))
  end

  test "should show item_collection" do
    get :show, id: @item_collection
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_collection
    assert_response :success
  end

  test "should update item_collection" do
    patch :update, id: @item_collection, item_collection: { beginDate: @item_collection.beginDate, name: @item_collection.name, user_id: @item_collection.user_id }
    assert_redirected_to item_collection_path(assigns(:item_collection))
  end

  test "should destroy item_collection" do
    assert_difference('ItemCollection.count', -1) do
      delete :destroy, id: @item_collection
    end

    assert_redirected_to item_collections_path
  end
end
