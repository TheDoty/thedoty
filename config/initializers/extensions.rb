Dir[File.join(Rails.root, "lib", "extensions", "*.rb")].each {|l| require l }
