class BatalhaPokemos 
  attr_accessor :pokemon1, :pokemon2 # Variáveis do jogo

  def initiate_variables # Configura o estado das variáveis antes do jogo
    @pokemon1 = select_pokemon # Inicia a variável
    @pokemon2 = select_pokemon
    # @ = variável de instância (pode ser acessada em toda instância da classe)
  end

  def start_battle
    puts "\n"
    puts "------| Batalha de Pokémons iniciada |------"
    puts "\n"
    current_player = rand(1..2) #Escolhe aleatoriamente os pokémons que irão jogar
    puts "#{@pokemon1} vs #{@pokemon2}"
    puts "\n"

    #Vida dos pokémons
    life_pokemon1 = 100
    life_pokemon2 = 100

    while life_pokemon1 > 0 && life_pokemon2 > 0 #Se a vida dos pokémons for MAIOR que 0
      if current_player == 1 #Se for a vez do pokemon1
        attack_damage = rand(1..10) #Um valor aleatório é aplicado (rand) como dano do ataque ao adversário
        puts "#{@pokemon1} atacou o #{@pokemon2} gerando danos de #{attack_damage} em sua vida >_<"
        life_pokemon2 -= attack_damage #Cálculo sob o ataque
        
      else #Se for a vez do pokemon2
        attack_damage = rand(1..10) #Loop anterior
        puts "#{@pokemon2} atacou o #{@pokemon1} gerando danos de #{attack_damage} em sua vida O.o"
        life_pokemon1 -= attack_damage
      end

      puts "\n"
      puts "-------------| Status de vida |-------------"
      puts "\n"
      puts "#{@pokemon1}: #{life_pokemon1}"
      puts "#{@pokemon2}: #{life_pokemon2}"
      puts "\n"
      puts "--------------------------------------------"
      puts "\n"
      
      if life_pokemon1 <= 0 #Se a vida do pokemon1 for MENOR ou IGUAL que 0
        puts "O vencedor da batalha foi o #{@pokemon2}!!!!"
        puts "Até a próxima batalha amigo o.<"
        break #Encerra jogo
        
      elsif life_pokemon2 <= 0 #Se a vida do pokemon2 for MENOR ou IGUAL que 0
        puts "O vencedor da batalha foi o #{@pokemon1}!!!!"
        puts "Até a próxima batalha amigo o.<"
        break #Encerra jogo
      end
      puts "\n"
      puts "Pressione 'Enter' para continuar a batalha..."
      puts "\n"
      gets.chomp # gets = Recebe a entrada do teclado 
      # chomp = Remover o "caractere" (enter) da nova linha gerada
      
      current_player = (current_player == 1) ? 2 : 1 #Alterna o jogador atual entre 1 e 2
    end
  end

  private
  #Métodos privados só podem ser chamados internamente pela instância da classe onde estão definidos
  
  def select_pokemon #Cria lista de pokémons
    pokemon_list = ["Pikachu Amarelo", "Pikachu Rosa", "Pikachu Verde", "Pikachu Azul", "Pikachu Vermelho"]
    pokemon_list.sample #Seleciona o opção da lista aleatoriamente com método "sample"
  end
end

batalha = BatalhaPokemos.new 
batalha.initiate_variables
batalha.start_battle
