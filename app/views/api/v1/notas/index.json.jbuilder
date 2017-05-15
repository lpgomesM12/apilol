json.array!(@notas) do |i|
  json.id i.id
  json.titulo i.titulo
  json.texto i.texto
  json.date_visualizacao(i.date_visualizacao.strftime('%d-%m-%Y %H:%M')) rescue nil
  json.cont_visualizacao i.cont_visualizacao
  json.status i.status.to_s.capitalize
  json.tipo i.tipo
end
