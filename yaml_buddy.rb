# frozen_string_literal: true

module YamlBuddy
  def take_yaml(yaml)
    @data = YAML.safe_load(yaml)
    @data.each do |hash|
      hash.keys.map { |key| hash[key.to_s] = hash.delete(key) }
    end
  end

  def to_yaml
    @data = @data.to_yaml
  end
end
