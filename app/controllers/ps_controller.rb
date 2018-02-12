class PsController < ApplicationController
  def index
    @out = `docker ps`
  end
end
