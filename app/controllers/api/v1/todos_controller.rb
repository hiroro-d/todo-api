class Api::V1::TodosController < ApplicationController
    before_action :set_user
    before_action :set_user_todo, only: [:show, :update, :destroy]
  
    # 特定のユーザーのすべてのタスクを一覧表示
    def index
      render json: @user.todos
    end
  
    # 特定のタスクの詳細情報を表示
    def show
      render json: @todo
    end
  
    # 新規タスクの作成
    def create
      @user.todos.create!(todo_params)
      render json: @user, status: :created
    end
  
    # 特定のタスクの情報更新
    def update
      @todo.update(todo_params)
      head :no_content
    end
  
    # 特定のタスクの削除
    def destroy
      @todo.destroy
      head :no_content
    end
  
    private
  
    def todo_params
      params.require(:todo).permit(:title, :completed)
    end
  
    def set_user
      @user = User.find(params[:user_id])
    end
  
    def set_user_todo
      @todo = @user.todos.find_by!(id: params[:id]) if @user
    end
  end
  