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

    respond_with document, location: edit_document_path(document), notice: nil
  end

  def edit
  end

  def update
  end

  private

  def document_params
    params.require(:document).permit(:text, :name, :language, entity_attributes: %i[name _destroy])
  end
end
