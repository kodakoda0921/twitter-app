class TweetsController < ApplicationController
  before_action :twitter_client

  def twitter_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "OpbunzPRbsnsfZg2F3HjGjgVw"
      config.consumer_secret = "BmBRUUIT7YwVKS2mh2GfNhLq4kv0d4dYpMGBuvPKspXmqdcDfM"
      config.access_token = "1360506360832552961-yZIsoNAUATg3g2TNdGk8qHs5jOoi1w"
      config.access_token_secret = "0xi8fRPiES5gMx5uAqqOZpeeWnFMMGBAjwokdRayFXZiu"
    end
  end

  def post
    logger.error("=====================================")
    @client.update("pineaaaa")
    redirect_to :root
  end

  def new
    @tweet = Tweet.new
  end

  def create
    #Tweet.create(create_params)
    logger.error(params[:text])
    @client.update(params[:text])
    redirect_to :root
  end

  private

  def create_params
    params.require(:tweet).permit(:text, :image)
  end
end
