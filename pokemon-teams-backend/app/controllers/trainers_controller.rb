class TrainersController < ApplicationController
    def index
        @trainers = Trainer.all 
        render json: TrainerSerializer.new(@trainers)
    end

    def show
        if find_trainer 
            render json: TrainerSerializer.new(@trainer)
        else  
            render json: {message: 'Trainer not found'}
        end
    end

    private

    def find_trainer
        @trainer = Trainer.find_by(id:params[:id])
    end
end
