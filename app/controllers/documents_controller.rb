class DocumentsController < ApplicationController
  expose :documents, -> { Document.order(created_at: :desc).page(params[:page]).per(15) }
  expose :document

  def index
  end

  def show
  end

  def new
  end

  def create
    CreateDocument::Process.call(document: document)

    respond_with document, location: edit_document_path(document)
  end

  def edit
  end

  def update
    UpdateDocument.call(document: document, document_params: document_params)

    respond_with document
  end

  private

  def document_params
    params.require(:document).permit(:text, :name, :language,
      project_gems_attributes: %i[id name _destroy],
      entities_attributes: [:id, :name, :_destroy, fields_attributes: %i[id name kind _destroy]])
  end
end
