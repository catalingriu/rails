class Admin::PlatformsController < Admin::ApplicationController
    before_action :set_platform, only: [:show, :edit, :update, :destroy]
      
    def index
        if params[:search]
          @platforms = Platform.search(params[:search]).all.order('created_at DESC').paginate(per_page: 10, page: params[:page])
        else
          @platforms = Platform.all.order('created_at DESC').paginate(per_page: 10, page: params[:page])
        end
    end
      
        
    def show
    end
      
    def new
      @platform = Platform.new
    end

    def edit
    end
      
    def create
      @platform = Platform.new(platform_params)
  
      respond_to do |format|
        if @platform.save
          format.html { redirect_to admin_platforms_path, notice: 'Platform was successfully created.' }
          format.json { render :show, status: :created, location: admin_platforms_path }
        else
          format.html { render :new }
          format.json { render json: @platform.errors, status: :unprocessable_entity }
        end
      end
    end
   
    def update
        if @platform.update(platform_params)
          redirect_to admin_platforms_path, notice: 'Platform was successfully updated.' 
        else
          render :edit 
        end
    end
      
        # DELETE /platforms/1
        # DELETE /platforms/1.json
    def destroy
      @platform.destroy
      redirect_to admin_platforms_url, notice: 'Platform was successfully destroyed.' 
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_platform
        @platform = Platform.find(params[:id])
      end
  
      # Only allow a list of trusted parameters through.
      def platform_params
        params.require(:platform).permit(:name)
      end

end
