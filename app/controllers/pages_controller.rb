class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home , :page ]

  def home
  end

  def page
  end

end
