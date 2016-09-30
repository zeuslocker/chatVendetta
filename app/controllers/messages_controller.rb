class MessagesController < ApplicationController
    before_action :set_message, only: [:destroy, :show]
     def index
         @message = Message.new
     end
    def show
        
    end
    def new
        @message = Message.new
    end
    def create
        @message = Message.new(message_params)
       # @message.body = AESCrypt.encrypt(@message.body, key)
        if @message.save 
            render :link
        end
    end
    def destroy
        
    end
    protected
    
    def set_message
        @message = Message.find(params[:id])
    end
    def message_params
        params.require(:message).permit(:body, :timer)
    end
end
