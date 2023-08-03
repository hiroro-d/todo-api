class Api::V1::UsersController < ApplicationController

    # すべてのユーザーを一覧表示
    def index
      @users = User.all
      render json: @users
    end
  
    # 特定のユーザーの詳細情報を表示
    def show
      @user = User.find(params[:id])
      render json: @user
    end
  
    # 新規ユーザーの作成
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # 特定のユーザーの情報更新
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # 特定のユーザーの削除
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      render json: { message: 'User has been deleted' }
    end
  
    private
  
    def user_params
      params.require(:user).permit(:name, :email)
    end
  end
  