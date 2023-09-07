class BatalhaPokemos 
  attr_accessor :pokemon1, :pokemon2 # Variáveis do jogo

  def inicia_variaveis # Configura o estado das variáveis antes do jogo
    @pokemon1 = seleciona_pokemon # Inicia a variável
    @pokemon2 = seleciona_pokemon
    # @ = variável de instância (pode ser acessada em toda instância da classe)
  end

  def inicia_batalha
    puts "\n"
    puts "------| Batalha de Pokémons iniciada |------"
    puts "\n"
    jogador_atual = rand(1..2) #Escolhe aleatoriamente os pokémons que irão jogar
    puts "#{@pokemon1} vs #{@pokemon2}"
    puts "\n"

    #Vida dos pokémons
    vida_pokemon1 = 20
    vida_pokemon2 = 20

    while vida_pokemon1 > 0 && vida_pokemon2 > 0 #Se a vida dos pokémons for MAIOR que 0
      if jogador_atual == 1 #Se for a vez do pokemon1
        dano_do_ataque = rand(1..10) #Um valor aleatório é aplicado (rand) como dano do ataque ao adversário
        puts "#{@pokemon1} atacou o #{@pokemon2} gerando danos de #{dano_do_ataque} em sua vida >_<"
        vida_pokemon2 -= dano_do_ataque #Cálculo sob o ataque
        
      else #Se for a vez do pokemon2
        dano_do_ataque = rand(1..10) #Loop anterior
        puts "#{@pokemon2} atacou o #{@pokemon1} gerando danos de #{dano_do_ataque} em sua vida O.o"
        vida_pokemon1 -= dano_do_ataque
      end

      puts "\n"
      puts "-------------| Status de vida |-------------"
      puts "\n"
      puts "#{@pokemon1}: #{vida_pokemon1}"
      puts "#{@pokemon2}: #{vida_pokemon2}"
      puts "\n"
      puts "--------------------------------------------"
      puts "\n"
      
      if vida_pokemon1 <= 0 #Se a vida do pokemon1 for MENOR ou IGUAL que 0
        puts "O vencedor da batalha foi o #{@pokemon2}!!!!"
        puts "Até a próxima batalha amigo o.<"
        break #Encerra jogo
        
      elsif vida_pokemon2 <= 0 #Se a vida do pokemon2 for MENOR ou IGUAL que 0
        puts "O vencedor da batalha foi o #{@pokemon1}!!!!"
        puts "Até a próxima batalha amigo o.<"
        break #Encerra jogo
      end
      puts "\n"
      puts "Pressione 'Enter' para continuar a batalha..."
      puts "\n"
      gets.chomp # gets = Recebe a entrada do teclado 
      # chomp = Remover o "caractere" (enter) da nova linha gerada
      
      jogador_atual = (jogador_atual == 1) ? 2 : 1 #Alterna o jogador atual entre 1 e 2
    end
  end

  private
  #Métodos privados só podem ser chamados internamente pela instância da classe onde estão definidos
  
  def seleciona_pokemon #Cria lista de pokémons
    pokemon_list = ["Pikachu Amarelo", "Pikachu Rosa", "Pikachu Verde", "Pikachu Azul", "Pikachu Vermelho"]
    pokemon_list.sample #Seleciona o opção da lista aleatoriamente com método "sample"
  end
end

batalha = BatalhaPokemos.new 
batalha.inicia_variaveis
batalha.inicia_batalha
