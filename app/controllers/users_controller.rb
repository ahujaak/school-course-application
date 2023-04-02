# frozen_string_literal: true

class UsersController < ApplicationController
  
  def index
    @users = User.all
    @users = @users.where(role: params[:role]) if params[:role]
  end
end
