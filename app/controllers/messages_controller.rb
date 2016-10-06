class MessagesController < ApplicationController
    before_action :set_message, only: [:destroy, :show]
    KEY = 'dfgert45fg4thvb6gh88989u64ggh'
     def index
         @message = Message.new
     end
    def show
    if @message.timer == true
        if Message.actual.exists?(@message)
            @decrMsgBody = AES.decrypt(@message.body, KEY)
        render '_showmsg' 
        else
       render '_404'
        end
    else
        @decrMsgBody = AES.decrypt(@message.body, KEY)
       render '_showmsg' 
       @message.destroy
    end
    end
    def new
       # @message = Message.new
    end
    def create
        
        @message = Message.new(message_params)
        encrMsg = AES.encrypt(@message.body, KEY)
        @message.body = encrMsg 
        if @message.timer == true 
           @message.expires_at = Time.now + 1.hour
        end
        if @message.save 
             @decrMsgBody = AES.decrypt(@message.body, KEY)
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
