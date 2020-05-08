class GamesController < ApplicationController
  before_action :set_game, only: [:show, :borrow, :return]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    if params[:search]
      @games = Game.search(params[:search]).all
    else
      @games = Game.all.order_list(params[:sort_by])
    end
    
      @game_ids = []
      @plaform_filter = []

      Platform.all.each do |pl|
        if(params[pl.name]=="1")
            @plaform_filter[pl.id] = 1
            @game_ids += pl.game_ids
        end
      end
     
      if(@game_ids.empty?)
          Platform.all.each do |pl|
            @game_ids += pl.game_ids if Platform.platform_filter[pl.id] == 1
          end
      else
          Platform.set_platform_filter(@plaform_filter)
      end

      @games = @games.where(id: @game_ids) unless @game_ids.empty?
      
      @games.paginate(per_page: 12, page: params[:page])
  end



  def show
  end



  def borrow

    if Loan.find_by(game_id: @game.id, user_id: current_user.id, ended_at: nil) != nil 
      redirect_to game_path(@game), notice: 'You already own this game.'
    elsif Loan.where(user_id: current_user.id, ended_at: nil).length == 3
      redirect_to game_path(@game), notice: 'You can\'t have more then 3 games.'
    else
      @game.quantity -= 1;
      @new_loan = Loan.new(user_id: current_user.id, game_id: @game.id, started_at: Time.now)

      if @game.quantity>=0 && @new_loan.save && @game.save #to do try catch ? transaction
          ReturnGameNotifierJob.set(wait: Loan::TILL_NOTIFICATION).perform_later(@new_loan)
          RetrieveGameAfterDeadlineJob.set(wait: Loan::TILL_RETRIEVE).perform_later(@new_loan)
          redirect_to mygames_path, notice: 'Game was successfully borrowed.' 
      else
          redirect_to game_path(@game), notice: 'Not available.'
      end

    end
  end



  def return  #same
    l = Loan.find_by(game_id: @game.id, user_id: current_user.id, ended_at: nil)

    if l.nil?
      redirect_to game_path(@game), notice: 'Try again later.'
    end

    @game.quantity +=1;
    l.ended_at = Time.now

    if(l.save && @game.save) 
        redirect_to mygames_path, notice: 'Game was successfully returned.' 
    else
        redirect_to game_path(@game), notice: 'Try again later.'
    end
  end


  def mygames
    @all_loans =  Loan.where("user_id = ?", current_user.id).order('ended_at DESC').paginate(per_page: 12, page: params[:page])
  end

  def about
  end

  private
  def set_game
    @game = Game.find(params[:id])
  end
   
  def game_params
    params.require(:game).permit(:name, :quantity, :year, :trailer, :avatar, :about)
  end
end
