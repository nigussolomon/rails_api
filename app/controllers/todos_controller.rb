class TodosController < ApplicationController
  before_action :authenticate_user!, :logged_in_user

  def my_todos
    @my_todos = Todo.where(user_id: logged_in_user)
    render json: {data: @my_todos, success: true, status: 200}
  end

  def create
    if todo_params['user_id'] == logged_in_user 
      @todo = Todo.new(todo_params)
      if @todo.save
        render json: {data: @todo, success: true, status: 200}
      else
        render json: {errors: @todo.errors, success: false, status: 400}
      end
    else
      render json: {errors: "User not authorized", success: false, status: 400}
    end
  end

  def update
    if todo_params['user_id'] == logged_in_user
      @todo = Todo.find(params[:id])
      if @todo.update(todo_params)
        render json: {data: @todo, success: true, status: 200}
      else
        render json: {errors: @todo.errors, success: false, status: 400}
      end
    else
      render  json: {errors: "User not authorized", success: false, status: 400}
    end
  end

  def destroy
    if todo_params['user_id'] == logged_in_user
      @todo = Todo.find(params[:id])
      if @todo.destroy
        render json: {data: @todo, success: true, status: 200}
      else
        render json:  {errors: @todo.errors, success: false, status: 400}
      end
    else
      render json: {errors: "User not authorized", success: false, status: 400}
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :status, :user_id, :reminder)
  end
end
