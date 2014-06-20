require 'sinatra'
require 'mandrill'

enable :sessions

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

get '/counter' do
	erb :counter
end

post '/send-mail' do

	send_message(params[:from], params[:body]) 
	redirect to('/index')

end

get '/counter' do
	session['counter'] ||= 0
	session['counter'] += 1
	"You've hit this page #{session['counter']} times."
end