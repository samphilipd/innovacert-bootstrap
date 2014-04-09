class UclsController < ApplicationController

  # GET /ucls/index
  def index
    @ucls = Ucl.all
  end
end
