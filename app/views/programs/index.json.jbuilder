json.array!(@programs) do |program|
  json.extract! program, :id, :title, :subtitle, :code
  json.url program_url(program, format: :json)
end
