class Book
  # Можливість зробити сетери та гетери без явних методів екземпляру
  # attr_accessor :name, :author, :year

  # Конструктор
  def initialize(name, author, year)
    @name = name
    @author = author
    @year = year
  end

  # Гетери та сетери, що прописані вручну
  def name
    @name
  end

  def author
    @author
  end

  def year
    @year
  end

  def name=(name)
    @name = name
  end

  def author=(author)
    @author = author
  end

  def year=(year)
    @year = year
  end
end

# Створення екземпляру зі спеціальними одруківками
alice_in_wonderland = Book.new("Alicce in Wonderland", "Lewwis Carroll", 1864)

# Виведення значень гетерів
puts alice_in_wonderland.name
puts alice_in_wonderland.author
puts alice_in_wonderland.year

# Виправлення властивостей сетерами
alice_in_wonderland.name = "Alice in Wonderland"
alice_in_wonderland.author = "Lewis Carroll"
alice_in_wonderland.year = 1865

# Повторне виведення
puts alice_in_wonderland.name
puts alice_in_wonderland.author
puts alice_in_wonderland.year