require 'spec_helper'

describe "posts/edit" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :category => nil,
      :title => "MyString",
      :body => "MyText"
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "input#post_category[name=?]", "post[category]"
      assert_select "input#post_title[name=?]", "post[title]"
      assert_select "textarea#post_body[name=?]", "post[body]"
    end
  end
end