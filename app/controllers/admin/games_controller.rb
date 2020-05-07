class Admin::GamesController < Admin::ApplicationController
    before_action :set_game, only: [:show, :edit, :update, :destroy, :hide]

    def index
      if params[:search]
        @games = Game.search(params[:search]).all.order('created_at DESC').paginate(per_page: 10, page: params[:page])
      else
        @games = Game.all.order('created_at DESC').paginate(per_page: 10, page: params[:page])
      end
    end

    def new
        @game = Game.new
    end
    
    def show
    end

    def edit  
    end

    def create
        @game = Game.new(game_params)
    
        respond_to do |format|
          if @game.save
            format.html { redirect_to admin_game_path(@game), notice: 'Game was successfully created.' }
            format.json { render :show, status: :created, location: admin_game_path(@game) }
          else
            format.html { render :new }
            format.json { render json: @game.errors, status: :unprocessable_entity }
          end
        end
    end
    
    def update
      respond_to do |format|
        if @game.update(game_params)
          format.html { redirect_to admin_game_path(@game), notice: 'Game was successfully updated.' }
          format.json { render :show, status: :ok, location: admin_game_path(@game) }
        else
          format.html { render :new }
          format.json { render json: @game.errors, status: :unprocessable_entity }
        end
      end
    end

    def hide
    end

    def destroy
        @game.destroy
        respond_to do |format|
            format.html { redirect_to admin_games_path, notice: 'Game was successfully destroyed.' }
            format.json { head :no_content }
        end
    end


    private
    def set_game
        @game = Game.find(params[:id])
    end

    def game_params
        params.require(:game).permit(:name, :quantity, :year, :trailer, :avatar, :about, platform_ids:[])
    end
end
