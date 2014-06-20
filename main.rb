require 'sinatra'
require 'mandrill'

def send_message(from, body)
m = Mandrill::API.new
 message = {  
  :subject=> "New Message Recieved",  
   :from_name=> "Thomas Thornton",  
    :text=>body,   
    :to=>[   
    {
        :email=> "thomas.thornton@stonybrook.edu",    
        :name=> "Recipient1" 
    }  
        ],   
        
        :html=>"<html>#{body}</html>", 
        :from_email=> from
        } 
    sending = m.messages.send message  
    puts sending
 end

 # send_message("thomas.thornton@stonybrook.edu", "Can I get a little help?")


get '/index' do
	erb :index
end

post '/send-mail' do

	send_message(params[:from], params[:body]) 
	redirect to('/index')

end