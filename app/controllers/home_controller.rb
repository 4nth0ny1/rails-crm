class HomeController < ApplicationController
    def index
        @accounts = Account.first(3)
        @products = Product.first(4)
    end 
end 