require 'spec_helper'

feature "Home Page" do

  background { user_is_on(:home_page) }

  scenario "searching for a language" do
    pending
    searches_for("ruby")

    and_must_have_found(1, in: :search_results)
  end

  scenario "content of menu" do
    pending
    user_opens(:menu)
    he_must_see(:many, in: :menu_list)
  end

  scenario "user wants to go back to home page" do
    pending
    clicks_on(:logo)
    must_be_at(:home_page)
  end

  scenario "looking at activities" do
    pending
    he_must_see(:many_links, in: :activities)
  end

  scenario "reading this website's purpose" do
    pending
    he_must_see("text", in: :info)
  end

  scenario "user signs up" do
    open_form(:sign_up).and {
      fill_in :email,     with: "test"
      fill_in :password,  with: "test"
    }

    should_be_successful
  end

end
