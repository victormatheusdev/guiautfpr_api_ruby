require "open-uri"
require "ostruct"
require "json"


p "Digite seu RA: "
ra = gets.chomp #Para retirar o \n ao final
p "Digite sua senha:"
senha = gets.chomp #Para retirar o \n ao final
campus = "CAMPO_MOURAO" #Mude conforme seu câmpus

data = JSON.parse(open("https://guiautfprapi.herokuapp.com/v1/disciplinas_matriculadas?campus=#{campus}",
      http_basic_authentication: [ra, senha]).read, object_class: OpenStruct)

data.disciplinas.each{ |d| p "#{d.nome} - #{d.faltas} faltas"}
