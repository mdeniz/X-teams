json.array!(@mutants) do |mutant|
  json.extract! mutant, :id
  json.url mutant_url(mutant, format: :json)
end
