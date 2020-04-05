class AnalyzersController < ApplicationController
  expose :commands_list

  def new
  end

  def show
  end

  def create
    a = GenerateCommands.call(text: commands_list_params[:text])
    self.commands_list = a.commands_list

    redirect_to controller: "analyzers", action: "show", id: commands_list.id
  end

  private

  def commands_list_params
    params.require(:commands_list).permit(:text)
  end
end
