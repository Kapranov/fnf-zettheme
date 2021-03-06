require 'rails_helper'

RSpec.describe "categories/new", type: :view do
  before(:each) do
    assign(:category, Category.new(
      :user => nil,
      :name => "MyString",
      :description => "MyText",
      :displayed => false
    ))
  end

  it "renders new category form" do
    render

    assert_select "form[action=?][method=?]", categories_path, "post" do

      assert_select "input#category_user_id[name=?]", "category[user_id]"

      assert_select "input#category_name[name=?]", "category[name]"

      assert_select "textarea#category_description[name=?]", "category[description]"

      assert_select "input#category_displayed[name=?]", "category[displayed]"
    end
  end
end
