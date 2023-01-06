class PingsController < ApplicationController
  def show
    render plain: 'pong'
  end

  def sha
    render plain: `git rev-parse --short HEAD`
  end
end
