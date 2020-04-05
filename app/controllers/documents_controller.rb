class DocumentsController < ApplicationController
  expose :document

  def index
  end

  def show
  end

  def new
  end

  def create
    CreateDocument::Process.call(document: document)

    respond_with document
  end

  private

  def document_params
    params.require(:document).permit(:text, :name)
  end
end
