class CodigoPostal
  SORTED_RANGES = [
    {range_end: 19999999, code: "SP", name: "São Paulo"},
    {range_end: 28999999, code: "RJ", name: "Rio de Janeiro"},
    {range_end: 29999999, code: "ES", name: "Espírito Santo"},
    {range_end: 39999999, code: "MG", name: "Minas Gerais"},
    {range_end: 48999999, code: "BA", name: "Bahia"},
    {range_end: 49999999, code: "SE", name: "Sergipe"},
    {range_end: 56999999, code: "PE", name: "Pernambuco"},
    {range_end: 57999999, code: "AL", name: "Alagoas"},
    {range_end: 58999999, code: "PB", name: "Paraíba"},
    {range_end: 59999999, code: "RN", name: "Rio Grande do Norte"},
    {range_end: 63999999, code: "CE", name: "Ceará"},
    {range_end: 64999999, code: "PI", name: "Piauí"},
    {range_end: 65999999, code: "MA", name: "Maranhão"},
    {range_end: 68899999, code: "PA", name: "Pará"},
    {range_end: 68999999, code: "AP", name: "Amapá"},
    {range_end: 69299999, code: "AM", name: "Amazonas"},
    {range_end: 69399999, code: "RR", name: "Roraima"},
    {range_end: 69899999, code: "AM", name: "Amazonas"},
    {range_end: 69999999, code: "AC", name: "Acre"},
    {range_end: 72799999, code: "DF", name: "Distrito Federal"},
    {range_end: 72999999, code: "GO", name: "Goiás"},
    {range_end: 73699999, code: "DF", name: "Distrito Federal"},
    {range_end: 76799999, code: "GO", name: "Goiás"},
    {range_end: 76999999, code: "RO", name: "Rondônia"},
    {range_end: 77999999, code: "TO", name: "Tocantins"},
    {range_end: 78899999, code: "MT", name: "Mato Grosso"},
    {range_end: 79999999, code: "MS", name: "Mato Grosso do Sul"},
    {range_end: 87999999, code: "PR", name: "Paraná"},
    {range_end: 89999999, code: "SC", name: "Santa Catarina"},
    {range_end: 99999999, code: "RS", name: "Rio Grande do Sul"}
  ]

  attr_reader :state_code, :state_name, :cep_formatted, :cep_digits
  def initialize(cep)
    cep_fields = match_cep cep.to_s.strip
    if !cep_fields.nil?
      @cep_digits = "#{cep_fields[0].rjust(2, "0")}#{cep_fields[1]}#{cep_fields[2]}"
      @cep_formatted = "#{cep_fields[0].rjust(2, "0")}#{cep_fields[1]}-#{cep_fields[2]}"
      state = find_state_by_cep
      @state_code = state[:code]
      @state_name = state[:name]
    end
  end

  def find_state_by_cep
    SORTED_RANGES.each do |cep_range|
      return cep_range if @cep_digits.to_i <= cep_range[:range_end]
    end
    nil
  end

  def match_cep(cep)
    cep_regex = /^(\d{1,2})\.?(\d{3})-?(\d{3})$/
    match_data = cep.match(cep_regex)
    if match_data
      match_data[1..3]
    end
  end

  def ==(other)
    @cep_digits == other.cep_digits
  end

  def to_s
    @cep_formatted
  end
end
