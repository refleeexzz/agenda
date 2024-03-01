@agenda = [
    {nome: "guilherme", telefone: "45812381"},
    {nome: "jhon narizudo", telefone: "45313213"},
    {nome: "polono", telefone: "45131312321"}
]

def all_contacts
    @agenda.each do |contato|
        puts "#{contato[:nome]} - #{contato[:telefone]}"
        puts "-------------------------------------------"
    end
end

def adicionar_contatos
    print "Nome:"
    nome = gets.chomp
    print "Telefone:"
    telefone = gets.chomp 

    @agenda << {nome: nome, telefone: telefone}
end

def ver_contato
    print "Qual contato você deseja?:"
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            puts "#{contato[:nome]} - #{contato[:telefone]}"
            
        end
    end
    puts "-------------------------------------------"
end

def editar_contato
    print "Qual nome deseja editar?:"
    nome = gets.chomp

    @agenda.each do |contato|
        if contato[:nome].downcase.include?(nome.downcase)
            print "Nome para editar(Se quiser deixar o mesmo nome, aperte o enter)"
            nome_salvo = contato[:nome]

            contato[:nome] = gets.chomp
            contato[:nome] = contato[:nome].empty? ? nome_salvo : contato[:nome]



            print "Telefone para editar(Se quiser deixar o mesmo nome, aperte o enter)"
            telefone_salvo = contato[:telefone]

            contato[:telefone] = gets.chomp
            contato[:telefone] = contato[:telefone].empty? ? telefone_salvo : contato[:telefone]
        end
    end
end

def remover_contato
    print "Qual nome deseja remover?:"
    nome = gets.chomp

    @agenda.delete_if { |contato| contato[:nome].downcase.include?(nome.downcase) }
end

loop do
    puts "1.Contatos\n2. Adicionar Contato\n3. Ver contato\n4. Editar contato\n5. Remover contato \n0. Sair."
    codigo = gets.chomp.to_i 
    case codigo
    when 0
        puts "Até logo."
        break
    when 1
        all_contacts
    when 2
        adicionar_contatos
    when 3
        ver_contato
    when 4
        editar_contato
    when 5
        remover_contato
    else
        puts "Opção inválida. Tente novamente."
    end
end