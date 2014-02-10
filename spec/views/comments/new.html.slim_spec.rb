require 'spec_helper'

describe "comments/new" do
  before(:each) do
    assign(:comment, stub_model(Comment,
      :user => nil,
      :post => nil,
      :body => "MyText",
      :status => "MyString"
    ).as_new_record)
  end

  it "renders new comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comments_path, "post" do
      assert_select "input#comment_user[name=?]", "comment[user]"
      assert_select "input#comment_post[name=?]", "comment[post]"
      assert_select "textarea#comment_body[name=?]", "comment[body]"
      assert_select "input#comment_status[name=?]", "comment[status]"
    end
  end
end
