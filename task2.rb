class TestClass
  attr :some_variable

  def initialize(some_variable)
    @some_variable = some_variable
  end

  def test_use_block
    if block_given?
      # Виконати блок за наявності та зберегти результат
      # Передача неочікуваної кількості параметрів не
      # викликає помилку
      block_result = yield
      puts "Return from block: #{block_result}"
    else
      puts "Block is not provided"
    end
  end
end

# Зовнішня змінна
a = 2

test_instance = TestClass.new(12345)

# Передача блоку, що нестрого очікує два параметри
test_instance.test_use_block do |param1, param2|

  # Нема доступу до змінної класу
  # puts some_variable

  # Наявний доступ до зовнішньої змінної
  puts a

  # Параметри мають або визначене значення, або nil,
  # якщо їх не передано
  puts param1, param2
  puts "My custom logic"

  # Повернення певного результату
  "Some block return"
end

# Передача блоку у вигляді одного рядка
test_instance.test_use_block { puts "A one-line block" }