# 1. Base products abstract implementations
class Button
  def click
    raise NotImplementedError, "#{self.class} does not implements such method '#{__method__}'"
  end
end

class Checkbox
  def check
    raise NotImplementedError, "#{self.class} does not implements such method '#{__method__}'"
  end
end

# 2. Abstract factory
class AbstractGUIFactory
  def create_button
    raise NotImplementedError, "#{self.class} does not implements such method '#{__method__}'"
  end

  def create_checkbox
    raise NotImplementedError, "#{self.class} does not implements such method '#{__method__}'"
  end
end

# 3. Real (non-abstract) products
class LinuxButton < Button
  def click
    puts "Click on a button in Linux env."
  end
end

class LinuxCheckbox < Checkbox
  def check
    puts "Click on a checkbox in Linux env."
  end
end

class MacButton < Button
  def click
    puts "Click on a button in Mac env."
  end
end

class MacCheckbox < Checkbox
  def check
    puts "Click on a checkbox in Mac env."
  end
end

# 4. Real factories
class LinuxGUIFactory < AbstractGUIFactory
  def create_button
    LinuxButton.new
  end

  def create_checkbox
    LinuxCheckbox.new
  end
end

class MacGUIFactory < AbstractGUIFactory
  def create_button
    MacButton.new
  end

  def create_checkbox
    MacCheckbox.new
  end
end

# 5. Usage
if ARGV.length == 0
  puts "Possible arguments:"
  puts "\tmac - run in macOS mode"
  puts "\tlinux - run in Linux mode"
  return
end

mode = ARGV[0]

if mode != "mac" && mode != "linux"
  puts "Wrong parameter"
  return
end

if mode == "linux"
  factory = LinuxGUIFactory.new
else
  factory = MacGUIFactory.new
end

button = factory.create_button
checkbox = factory.create_checkbox

# No need to correct code for new factories as all of instances have the same interface
button.click
checkbox.check
button.click
checkbox.check