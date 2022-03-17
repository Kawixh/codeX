# frozen_string_literal: true
module Api
  module V1
    # BlogsController will handle all tasks related
    # to blogs in this project for now.
    class BlogsController < ApplicationController
      before_action :find_blog, only: %i[show update destroy]

      def destroy
        # code here
      end

      def update
        # code here
      end

      def show
        # code here
      end

      private

      def blog_params
        params.require(:blog).permit(:title, :header, :body)
      end

      def find_blog
        @blog = Blog.find(params[:id])
      end
    end
  end
end
