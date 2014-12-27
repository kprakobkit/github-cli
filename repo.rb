class Repo
  def initialize(data)
    create_methods(data)
  end

  def create_methods(data)
    data.each { |key, value| define_singleton_method key.to_sym, -> { value } }
  end
end
