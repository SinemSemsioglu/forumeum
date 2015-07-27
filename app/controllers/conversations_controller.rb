class ConversationsController < ApplicationController
	before_action :authenticate_user!
	before_action :get_mailbox
	before_action :get_box, only: [:index]
	before_action :get_conversation, except: [:index]
	
	def index
	  if @box.eql? "inbox"
		@conversations = @mailbox.inbox
	  elsif @box.eql? "sent"
		@conversations = @mailbox.sentbox
	  else
	    return
	  end
	  @conversations = @conversations.paginate(page: params[:page], per_page: 10)
	end
 
	def reply
	  current_user.reply_to_conversation(@conversation, params[:body])
	  flash[:success] = 'Reply sent'
	  redirect_to conversation_path(@conversation)
	end
	
	def show
	
	end
	
	private
	
	def get_box
	  if params[:box].blank? or !["inbox","sent"].include?(params[:box])
		params[:box] = 'inbox'
	  end
	  @box = params[:box]
	end
	
	def get_mailbox
		@mailbox ||= current_user.mailbox
	end
	
	def get_conversation
		@conversation ||= @mailbox.conversations.find(params[:id])
	end
	
end



#def index
#	  @conversations = @mailbox.inbox.paginate(page: params[:page], per_page: 10)
#	end
	
 
