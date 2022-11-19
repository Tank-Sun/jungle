class AboutController < ApplicationController

  # Add a before_action to any controller that you want to secure. 
  # This will force user's to login before they can see the actions in this controller.
  # before_action :authorize
  def index
    @description = "Looking for a way to add some life to your home? Look no further than our online plant shop! We have a wide variety of beautiful plants and flowers, as well as all the accessories you need to keep them healthy and happy. Plus, our prices are unbeatable! So what are you waiting for?

    At our online plant shop, we only sell the highest quality plants and flowers. We source our products from reputable growers and nurseries, so you can be sure you're getting a healthy, beautiful plant. Plus, ordering is quick and easy! We offer free shipping on all orders over $50, so it's easy to get the plants you want without breaking the bank.
    
    We have a wide variety of plants and flowers available for purchase on our website. Whether you're looking for something small and delicate or big and bold, we have the perfect plant for you. We also carry a selection of accessories, including potting soil, pots and containers, watering cans, and more."
  end
end
