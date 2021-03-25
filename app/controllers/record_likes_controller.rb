class RecordLikesController < ApplicationController
    before_action :set_like

    def create
        @user = current_user
        @record = Record.find(params[:record_id])
        @like = RecordLike.create!(user_id: @user.id, record_id: @record.id)
        
    end

    def destroy
        @user = current_user
        @record = Record.find(params[:record_id])
        @like = RecordLike.find_by(user_id: @user.id, record_id: @record.id)
        @like.destroy
    end
    
    private
    def set_like
        @record = Record.find(params[:record_id])
    end
end
