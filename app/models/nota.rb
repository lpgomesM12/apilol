class Nota < ApplicationRecord
  searchkick
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  validates :titulo, presence: true
  validates :texto, presence: true

  enum status: {ativa: 1, inativa: 2, rascunho: 3}
  enum tipo: {publica: 1, privada: 2}

  before_create :default_cont

  def default_cont
      self.cont_visualizacao = 0
  end 

end
