# Функція для створення абревіатури з фрази
def make_abbr(phrase)
  # Перевірка на достатню довжину рядка
  if phrase.length == 0
    return nil
  end

  phrase
    .split(" ")
    .map { |word| word[0].upcase }
    .join("")
end

puts make_abbr("центральний обробник одиниць")
puts make_abbr("Сполучені Штати Америки")