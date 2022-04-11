require 'date'
print "Marque a tarefa: "
texto = gets
texto = texto.chomp

# Variável tempoA é para tratar casos como às 10, ou à 1. Variável trataMes é para tratar casos onde os meses são escritos, como 12 de fevereiro de 2023, e a variável data são para outros tipos de marcação de data.

tempoA= texto.scan(/às\s\d{2}|as\s\d{2}|a\s\d{1}|à\s\d{1}/)
data = texto.scan(/\d{2}\W\d{2}\W\d{4}|\d{2}\W\d{2}/)
trataMes = texto.scan(/\d{2}\s[a-z]{2}\s[a-zA-Z]{4,9}\s[a-z]{2}\s\d{4}|\d{2}\s[a-z]{2}\s[a-zA-Z]{3}ç[a-z]\s[a-z]{2}\s\d{4}/)
adverbiosTempo = texto.scan(/hoje|amanhã|depois de amanhã|amanha|depois de amanha/)
horario = texto.scan(/\d{2}\s\d{2}|\d{2}[:]\d{2}|\d{1,2}\shora/)
tag = texto.scan(/\#[a-zA-Z]+/)
pessoa = texto.scan(/com\s[a-zA-Z]+\se\s[a-zA-Z]+|com\s[a-zA-Z]+/)

data.each do |match|
  trataData = match
  if trataData.match(/\d{2}\s\d{2}|\d{2}\s\d{2}\s\d{4}|\d{2}[:]\d{2}/)
    next
  else
    puts "Data: " + trataData
  end
end

trataMes.each do |match| 
  mes = match
  if mes.match(/janeiro|Janeiro/) 
    puts "Data: " + mes.gsub(/\s[a-z]{2}\s[a-zA-Z]+\s[a-z]{2}\s/, "/01/")
  end
  if mes.match(/fevereiro|Fevereiro/) 
    puts "Data: " + mes.gsub(/\s[a-z]{2}\s[a-zA-Z]+\s[a-z]{2}\s/, "/02/")
  end
  if mes.match(/marco|Marco/) 
    puts "Data: " + mes.gsub(/\s[a-z]{2}\s[a-zA-Z]+\s[a-z]{2}\s/, "/03/")
  end
  if mes.match(/março|Março/) 
    puts "Data: " + mes.gsub(/\s[a-z]{2}\s[a-zA-Z]{3}ç[a-z]\s[a-z]{2}\s/, "/03/")
  end
  if mes.match(/abril|Abril/) 
    puts "Data: " + mes.gsub(/\s[a-z]{2}\s[a-zA-Z]+\s[a-z]{2}\s/, "/04/")
  end
  if mes.match(/maio|Maio/) 
    puts "Data: " + mes.gsub(/\s[a-z]{2}\s[a-zA-Z]+\s[a-z]{2}\s/, "/05/")
  end
  if mes.match(/junho|Junho/) 
    puts "Data: " + mes.gsub(/\s[a-z]{2}\s[a-zA-Z]+\s[a-z]{2}\s/, "/06/")
  end
  if mes.match(/julho|Julho/) 
    puts "Data: " + mes.gsub(/\s[a-z]{2}\s[a-zA-Z]+\s[a-z]{2}\s/, "/07/")
  end
  if mes.match(/agosto|Agosto/) 
    puts "Data: " + mes.gsub(/\s[a-z]{2}\s[a-zA-Z]+\s[a-z]{2}\s/, "/08/")
  end
  if mes.match(/setembro|Setembro/) 
    puts "Data: " + mes.gsub(/\s[a-z]{2}\s[a-zA-Z]+\s[a-z]{2}\s/, "/09/")
  end
  if mes.match(/outubro|Outubro/) 
    puts "Data: " + mes.gsub(/\s[a-z]{2}\s[a-zA-Z]+\s[a-z]{2}\s/, "/10/")
  end
  if mes.match(/novembro|Novembro/) 
    puts "Data: " + mes.gsub(/\s[a-z]{2}\s[a-zA-Z]+\s[a-z]{2}\s/, "/11/")
  end
  if mes.match(/dezembro|Dezembro/) 
    puts "Data: " + mes.gsub(/\s[a-z]{2}\s[a-zA-Z]+\s[a-z]{2}\s/, "/12/")
  end
end

horario.each do |match|
  trataHorario = match
  if trataHorario.match(/\d{2}\s\d{2}|\d{2}[:]\d{2}|\d/)
    puts "Horário: " + trataHorario.gsub(/ /, ":")
  end
  if trataHorario.match(/\d{2}\shora/)
    puts "Horário: " + trataHorario.gsub(/\s[a-z]{4,5}/, ":00")
  else
    if trataHorario.match(/\d{2}\s\d{2}|\d{2}[:]\d{2}/)
      next
    else
      puts "Horário: " + trataHorario.gsub(/\shora/, ":00")
    end
  end
end

tempoA.each do |match|
  transformaTempo = match
  if transformaTempo.match(/às\s\d{2}|as\s\d{2}/)
    puts "Horário: " + transformaTempo.gsub(/às\s|as\s/, "") + ":00"
  else
    puts "Horário: " + transformaTempo.gsub(/à\s|a\s/, "") + ":00"
  end
end

adverbiosTempo.each do |match|
  tempoLocal = match
  if tempoLocal.match(/depois de amanhã|depois de amanha/)
    date = Date.today+2
    puts "Data: " + date.strftime("%d/%m/%Y")
  end
  if tempoLocal.match(/hoje/)
    date = Date.today
    puts "Data: " + date.strftime("%d/%m/%Y")
  end
  if tempoLocal.match(/depois de amanhã|depois de amanha/)
    next
  end
  if tempoLocal.match(/amanhã|amanha/)
    date = Date.today+1
    puts "Data: " + date.strftime("%d/%m/%Y")
  end 
end

tag.each do |match|
  removeTag = match
  puts "Compromisso: " + removeTag.gsub(/#/, "")
end

pessoa.each do |match|
  nome = match
  if nome.match(/com\s[a-zA-Z]+\se\s[a-zA-Z]+/)
    puts "Pessoas: " + nome.gsub(/com /, "")
  end
  if nome.match(/com\s[a-zA-Z]+\se\s[a-zA-Z]+/)
    next
  else
    puts "Pessoa: " + nome.gsub(/com /, "")
  end
end
