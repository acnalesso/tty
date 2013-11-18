require 'spec_helper'
require 'controllers/home_controller'

describe HomeController do

  let(:home) { HomeController.new }
  context "#index" do
    it { home.should respond_to :index }
  end

end
