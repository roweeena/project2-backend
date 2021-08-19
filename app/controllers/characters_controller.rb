class CharactersController < ApplicationController
  before_action :set_character, only: %i[ show edit update destroy ]

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
    # @character.update character_params
    if @character.update character_params
        render json: {
        status: :updated,
        character: @character
    }
    else
       render json: {
       status: 500,
       errors: @character.errors.full_messages
    }
    end
  end

  # DELETE /characters/1 or /characters/1.json
  def destroy
    if @character.destroy
        render json: {
        status: :deleted,
        character: @character
    }
    else
       render json: {
       status: 500,
       errors: @character.errors.full_messages
    }
    end
  end

  private

  def set_character
      @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:name, :catchphrase, :job, :user_id, :items)
  end

end
