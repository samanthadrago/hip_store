class Store < ActiveRecord::Base
  attr_accessor :name, :tagline, :place, :image, :class

  WORDONE = ['salt', 'bourbon', 'chamomile', 'reindeer', 'moose', 'scarf', 'barley', 'quilt', 'bramble', 'dagger', 'cotton', 'candle', 'wool', 'flag', 'denim', 'arrow', 'beaver', 'owl', 'avocet', 'egret', 'ocelot', 'mist', 'fog', 'liquorice', 'hammer', 'anvil', 'wood', 'sickle', 'leather', 'awl', 'horse']
  WORDTWO = ['branch', 'charcoal', 'chestnut', 'burn', 'loon', 'creek', 'fig', 'pepper', 'fern', 'spice', 'soot', 'sand', 'gravel', 'loam', 'sawdust', 'elm', 'maple', 'willow', 'cactus', 'seed', 'snow', 'iron', 'colt', 'crow']
  ANDWORDS = ['&', '+', 'and', '//']

  ADJECTIVES = ['timeless', 'vintage', 'modern', 'rugged', 'curious', 'fastidious', 'feckless', 'fulsome', 'gustatory', 'heuristic', 'lachrymose', 'mannered', 'pendulous', 'salubrious', 'trenchant']
  NOUNS = ['knicknacks', 'garments', 'plates', 'dishes', 'potables', 'edibles', 'gifts', 'toys', 'children\'s clothing', 'accoutrements', 'novelties', 'ornaments', 'curios', 'baubles', 'attire', 'garb', 'pieces', 'decor', 'design']
  MADEVERBS = ['made', 'built', 'constructed', 'crafted', 'shaped', 'hand-crafted', 'curated', 'grown', 'fabricated']
  PLACES = ['brooklyn', 'portland', 'queens', 'san francisco', 'oakland', 'juneau', 'kuala lumpur', 'nashville', 'copenhagen', 'oslo', 'helsinki', 'havana', 'cambridge', 'somerville']

  IMAGES = ["https://images.unsplash.com/photo-1441742917377-57f78ee0e582?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1441716844725-09cedc13a4e7?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1441448770220-76743f9e6af6?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1441260038675-7329ab4cc264?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1441126270775-739547c8680c?fit=crop&fm=jpg&h=900&q=80&w=1200", "https://images.unsplash.com/photo-1440964829947-ca3277bd37f8?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1440882616325-43e474ece3d0?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1440847899694-90043f91c7f9?fit=crop&fm=jpg&h=725&q=80&w=1200", "https://images.unsplash.com/photo-1440688807730-73e4e2169fb8?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1440558899941-2b58b4b0e6ad?fit=crop&fm=jpg&h=950&q=80&w=1200", "https://images.unsplash.com/photo-1439902315629-cd882022cea0?fit=crop&fm=jpg&h=1200&q=80&w=1200", "https://images.unsplash.com/photo-1439853949127-fa647821eba0?fit=crop&fm=jpg&h=1775&q=80&w=1200", "https://images.unsplash.com/photo-1439694458393-78ecf14da7f9?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1437651025703-2858c944e3eb?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1434873740857-1bc5653afda8?fit=crop&fm=jpg&h=1775&q=80&w=1200", "https://images.unsplash.com/photo-1434064511983-18c6dae20ed5?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1431538510849-b719825bf08b?fit=crop&fm=jpg&h=1075&q=80&w=1200", "https://images.unsplash.com/photo-1428999418909-363f8e091c50?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1428604422807-314cf752cbc9?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1418386767268-77cdab4edcaa?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1439396087961-98bc12c21176?fit=crop&fm=jpg&h=675&q=80&w=1200", "https://images.unsplash.com/photo-1439003511744-2a0490ea0a88?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1438978280647-f359d95ebda4?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1438109519352-a52c41243c1a?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1436874555419-bb64221c5c1d?fit=crop&fm=jpg&h=900&q=80&w=1200", "https://images.unsplash.com/photo-1436397543931-01c4a5162bdb?fit=crop&fm=jpg&h=1200&q=80&w=1200", "https://images.unsplash.com/photo-1436390195361-c3c86efcf48b?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1436377734980-0ee004df570b?fit=crop&fm=jpg&h=750&q=80&w=1200", "https://images.unsplash.com/photo-1436367050586-7c605120bf73?fit=crop&fm=jpg&h=825&q=80&w=1200", "https://images.unsplash.com/photo-1436262513933-a0b06755c784?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1438503733096-e5c5560f05ed?fit=crop&fm=jpg&h=750&q=80&w=1200", "https://images.unsplash.com/photo-1437941792454-bacef7a7f736?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1434543177303-ef2cc7707e0d?fit=crop&fm=jpg&h=900&q=80&w=1200", "https://images.unsplash.com/photo-1433616174899-f847df236857?fit=crop&fm=jpg&h=725&q=80&w=1200", "https://images.unsplash.com/photo-1433321768402-e8ed97b0324c?fit=crop&fm=jpg&h=1200&q=80&w=1200", "https://images.unsplash.com/photo-1433148749784-5e235e9efd12?fit=crop&fm=jpg&h=900&q=80&w=1200", "https://images.unsplash.com/photo-1431932441182-250651654c23?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1430263326118-b75aa0da770b?fit=crop&fm=jpg&h=800&q=80&w=1200", "https://images.unsplash.com/photo-1428948304740-392e214d312f?fit=crop&fm=jpg&h=900&q=80&w=1200", "https://images.unsplash.com/photo-1415931633537-351070d20b81?fit=crop&fm=jpg&h=800&q=80&w=1200"]

  CLASSES = ['random']

  def initialize
    self.name = Store.generate_name
    self.tagline = Store.generate_tagline
    self.place = Store.generate_place
    self.image = Store.generate_image
    self.class = Store.generate_class
  end

  def self.generate_name
    WORDONE.sample + " " + ANDWORDS.sample + " " + WORDTWO.sample
  end

  def self.generate_tagline
    ADJECTIVES.sample + " " + NOUNS.sample + "."
  end

  def self.generate_place
    MADEVERBS.sample + " with love in " + PLACES.sample
  end

  def self.generate_image
    IMAGES.sample
  end

  def self.generate_class
    'random'
  end

end
