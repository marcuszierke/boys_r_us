class StaticpagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  def index
    @show_navbar_footer = false;
  end
end
