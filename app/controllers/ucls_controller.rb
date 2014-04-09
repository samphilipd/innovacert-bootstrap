class UclsController < ApplicationController

  # GET /ucls
  def index
    @ucls = Ucl.all
  end
end
