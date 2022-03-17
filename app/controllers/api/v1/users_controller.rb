# frozen_string_literal: true
module Api
  module V1
    # UsersController will handle all tasks related
    # to users in this project for now.
    class UsersController < ApplicationController
      before_action :authorize_request, except: :create
      before_action :find_user, except: %i[create index]

      def index
        @users = User.all
        render json: @users, status: :ok
      end

      def destroy
        @user.destroy
      end

      def update
        unless @user.update(user_params)
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      def show
        render json: @user, status: :ok
      end

      def create
        @user = User.new(user_params)
        if @user.save
          render json: @user, status: :created
        else
          render json: { errors: @user.errors.full_messages },
                 status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:username, :email, :password, :password_confirmation)
      end

      def find_user
        @user = User.find_by_username!(params[:_username])
      rescue ActiveRecord::RecordNotFound
        render json: { errors: 'User not found' }, status: :not_found
      end
    end
  end
end
