module Features
  module Helpers

    def user_is_on(url)
      visit normalise_path(url)
    end

    def user_opens(link)
      click_link "##{link}"
    end
    alias :clicks_on :user_opens

    def user_searches_for(text)
    end
    alias :searches_for :user_searches_for

    def he_must_see(expected, options = {})
      element_name = options.delete(:in)
      case expected
        when Integer
          options.merge!({ count: expected })
        when String
          options.merge!({ text: Regexp.new(expected) })
        when /many/
          options.merge!({ count: 3})
       end
        page.should have_content(element_name, options)
    end
    alias :and_must_see :he_must_see
    alias :and_must_have_found :he_must_see

    def open_form(element_name)
      @element_name = element_name
      self
    end

    def and(&block)
      within("##{@element_name}", &block)
    end

    def must_be_at(url)
      user_is_on(url)
      current_path.should eq(normalise_path(url))
    end

    ##
    # When url == :home_page returns "/" otherwise
    # returns url.to_s.
    #
    def normalise_path(url)
      url == :home_page && "/" || "/" << url.to_s
    end

    def should_be_successful
      page.should be_successul
    end
  end
end
