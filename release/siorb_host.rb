require 'sinatra'

class SiorbHost < Sinatra::Base

  get '/' do
    "Hello Siorb!"
  end

end

