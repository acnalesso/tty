require 'spec_helper'

describe HomeController do

  let(:home) { HomeController.new }
  context "#index" do
    it { home.should respond_to :index }
  end

end
