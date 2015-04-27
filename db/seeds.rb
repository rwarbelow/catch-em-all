class Seed
  def self.start
    new.generate
  end

  def generate
    create_pokemon
  end

  def create_pokemon
    pokemon.each do |name, image|
      Pokemon.create(name: name, image_url: image)
    end
    puts "#{Pokemon.all.map(&:name).join(", ")} created."
  end

  private

  def pokemon
    {"Pikachu"   => "http://core.dawnolmo.com/50_pokemon__9_pikachu_by_megbeth-d5fga3f_original.png",
    "Charmander" => "http://img4.wikia.nocookie.net/__cb20140603214902/pokemon/images/9/96/004Charmander_OS_anime.png",
    "Bulbasaur"  => "http://vignette4.wikia.nocookie.net/gpxplus/images/b/b4/001_Bulbasaur_Pic.png/revision/20101225095459",
    "Squirtle"   => "http://img4.wikia.nocookie.net/__cb20140916184226/pokemon/images/e/e7/007Squirtle_OS_anime.png",
    "Ivysaur"    => "http://th01.deviantart.net/fs70/PRE/f/2014/002/d/e/pokemon_y__ivysaur_by_smiley_fakemon-d70i6v4.png",
    "Blastoise"  => "http://fc03.deviantart.net/fs70/f/2010/243/4/c/blastoise_by_xous54-d2xqh0g.png",
    "Metapod"    => "http://upload.wikimedia.org/wikipedia/id/archive/6/6b/20130416085037!Metapod.png",
    "Caterpie"   => "http://img3.wikia.nocookie.net/__cb20140911042209/pokemon/images/8/89/010Caterpie_Dream.png",
    "Pidgeot"    => "http://fc03.deviantart.net/fs70/i/2012/072/6/b/_018_tauboss___pidgeot_by_mrsjasminhardy-d4smgtl.png",
    "Fearow"     => "http://vignette1.wikia.nocookie.net/es.pokemon/images/7/7b/Fearow_(anime_AG).png/revision/latest?cb=20120906023254",
    "Sandshrew"  => "http://cdn.bulbagarden.net/upload/9/9e/027Sandshrew.png",
    "Clefairy"   => "http://img1.wikia.nocookie.net/__cb20140910051252/pokemon/images/e/e8/035Clefairy_Dream.png",
    "Oddish"     => "http://fc00.deviantart.net/fs70/i/2011/123/9/1/oddish_by_beyx-d3fjesv.png",
    "Diglett"    => "http://fc06.deviantart.net/fs70/f/2010/165/9/4/050___Diglett_by_cammarin.png",
    "Meowth"     => "http://images.wikia.com/es.pokemon/images/1/13/Meowth_en_Pok%C3%A9mon_Mundo_Misterioso_2.png",
    "Dedenne"    => "http://assets22.pokemon.com/assets/cms2/img/pokedex/full/702.png"
    }
  end
end

Seed.start