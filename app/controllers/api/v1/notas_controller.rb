class Api::V1::NotasController < Api::V1::ApplicationController
  before_action :set_nota, only: [:show, :edit, :update, :destroy]

 def index
   if params[:q].present?
      @notas = Nota.search params[:q], fields: [:titulo, :texto]
    else
      @notas = Nota.all.order('updated_at DESC')   
   end

 end

 def show
   @nota.date_visualizacao ||= Time.now
   @nota.cont_visualizacao += 1
   @nota.save
 end

 def create
    @nota = Nota.new(nota_params)
    if @nota.save
      render :json => {msg: "Nota Cadastrada com sucesso!", erro: false}
    else
      render :json => {msg: @nota.errors, erro: true} 
    end
 end

 def update
     if @nota.update(nota_params)
         render :json => {msg: "Nota Alterada com sucesso!", erro: false }
      else
         render :json => {msg: @nota.errors, erro: true }
      end
  end

 private

  def set_nota
     @nota = Nota.find(params[:id])
  end

  def nota_params
    params.require(:nota).permit(:titulo, :texto, :date_visualizacao, :cont_visualizacao, :status, :tipo)
  end

 end
