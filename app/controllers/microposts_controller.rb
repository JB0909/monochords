class MicropostsController < ApplicationController

    def create
        @micropost = current_user.microposts.build(micropost_params)
        if @micropost.save
        else
            @microposts = current_user.microposts.order('created_at DESC')
        end
        @microposts = current_user.microposts.all
    end

    def destroy
        @micropost.destroy
        flash[:success] = 'メッセージを削除しました。'
        redirect_back(fallback_location: root_path)
    end

    private
    def micropost_params
        params.require(:micropost).permit(:body)
    end
end
