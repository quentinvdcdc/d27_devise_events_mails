class EventsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
  def index
  end
  def show
    @event = Event.find(params[:id])
    puts @event.title
  end
	def new
    @event = Event.new
	end
	def create
  	@event = Event.new(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], administrator: current_user, price: params[:price], location: params[:location])
  	if @event.save # essaie de sauvegarder en base @gossip
  	  # si ça marche, il redirige vers la page d'index du site
  	  #flash[:success] = "Oh le beau event !" #hash depuis l'application.html.erb
  	  redirect_to root_path
  	else
  	  # sinon, il render la view new (qui est celle sur laquelle on est déjà)
  	  #flash[:danger] = "Meh sans balloon c'est pas un vrai event" #idem
  	  render 'new'
  	end
  end
end
