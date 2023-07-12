class Api::MessagesController < ApplicationController
  def index
    unless Message.exists?
      Message.create([
                       { message: 'Hi!' },
                       { message: 'Hello!' },
                       { message: 'Good day!' },
                       { message: 'Hello, how are you?' },
                       { message: 'Good to see you!' }
                     ])
    end

    @message = Message.order(Arel.sql('RANDOM()')).limit(1)
    render json: @message
  end
end