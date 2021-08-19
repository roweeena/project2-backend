class CharactersController < ApplicationController
  # before_action :set_character

  def index
    @characters = Character.all
     if @characters
      current_user
      render json: {
      characters: @characters
     }
    else
      render json: {
      status: 500,
      error: ['No character found']
    }
    end

  end

  def show
    @character = Character.find(params[:id])
    if @character
       render json: {
       character: @character
    }
    else
       render json: {
       status: 500,
       errors: ['Account not found']
     }
    end
  end

  def new
    @character = Character.new
  end

  def edit
  end

  # POST /characters or /characters.json
  def create
    @character = Character.new(character_params)
    if @character.save
        render json: {
        status: :created,
        character: @character
    }
    else
       render json: {
       status: 500,
       errors: @character.errors.full_messages
    }
    end
  end

  # PATCH/PUT /characters/1 or /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
        format.html { redirect_to @character, notice: "Character was successfully updated." }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: "Character was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # def set_character
  #     @character = Character.find(params[:id])
  # end

  def character_params
    params.require(:character).permit(:name, :catchphrase, :job, :user_id)
  end

end
