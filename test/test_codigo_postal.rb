require_relative "../lib/codigo_postal"

class CodigoPostalTest < TLDR
  def test_find_state_by_cep
    ceps = [
      ["01000-000", "SP"],
      ["19999-999", "SP"],
      ["28000-000", "RJ"],
      ["28999-999", "RJ"],
      ["29000-000", "ES"],
      ["29999-999", "ES"],
      ["30000-000", "MG"],
      ["39999-999", "MG"],
      ["80000-000", "PR"],
      ["87999-999", "PR"],
      ["88000-000", "SC"],
      ["89999-999", "SC"],
      ["90000-000", "RS"],
      ["99999-999", "RS"],
      ["40000-000", "BA"],
      ["48999-999", "BA"],
      ["49000-000", "SE"],
      ["49999-999", "SE"],
      ["50000-000", "PE"],
      ["56999-999", "PE"],
      ["57000-000", "AL"],
      ["57999-999", "AL"],
      ["58000-000", "PB"],
      ["58999-999", "PB"],
      ["59000-000", "RN"],
      ["59999-999", "RN"],
      ["60000-000", "CE"],
      ["63999-999", "CE"],
      ["64000-000", "PI"],
      ["64999-999", "PI"],
      ["65000-000", "MA"],
      ["65999-999", "MA"],
      ["66000-000", "PA"],
      ["68899-999", "PA"],
      ["68900-000", "AP"],
      ["68999-999", "AP"],
      ["69000-000", "AM"],
      ["69299-999", "AM"],
      ["69300-000", "RR"],
      ["69399-999", "RR"],
      ["69400-000", "AM"],
      ["69899-999", "AM"],
      ["69900-000", "AC"],
      ["69999-999", "AC"],
      ["76800-000", "RO"],
      ["76999-999", "RO"]
    ]

    ceps.each do |cep, expected_code|
      assert_equal expected_code, CodigoPostal.new(cep).state_code
    end
  end

  def test_rio_pardo
    rio_pardo = CodigoPostal.new("13.720-000")
    assert_equal "SP", rio_pardo.state_code
    assert_equal "13720-000", rio_pardo.cep_formatted
    assert_equal "13720000", rio_pardo.cep_digits
  end

  def test_floripa
    floripa = CodigoPostal.new("88.063-500")
    assert_equal "SC", floripa.state_code
    assert_equal "88063-500", floripa.cep_formatted
    assert_equal "88063500", floripa.cep_digits
  end

  def test_catedral
    catedral = CodigoPostal.new(1001000)
    assert_equal "SP", catedral.state_code
    assert_equal "01001-000", catedral.cep_formatted
    assert_equal "01001000", catedral.cep_digits
  end

  def test_ibirapuera
    ibirapuera = CodigoPostal.new("04.094-050")
    reasonable_formats = [
      "04094-050",
      "04094050",
      "04.094-050",
      "04.094050",
      "4094050",
      "4094-050",
      "4.094050",
      "4.094-050",
      4094050
    ]
    unreasonable_formats = [
      "04-094.050",
      "04-094050",
      "04-094-050"
    ]

    reasonable_formats.each do |format|
      assert_equal ibirapuera, CodigoPostal.new(format)
    end

    unreasonable_formats.each do |format|
      refute_equal ibirapuera, CodigoPostal.new(format)
    end
  end

  def test_readme_examples
    assert_output("SP\nSão Paulo\n01001-000\n", "") do
      cep = CodigoPostal.new(1001000)
      puts cep.state_code # => 'SP'
      puts cep.state_name # => 'São Paulo'
      puts cep # => '01001-000'
    end

    assert_output("true\n", "") do
      cep1 = CodigoPostal.new(4094050)
      cep2 = CodigoPostal.new("04.094-050")
      puts cep1 == cep2 # => true
    end
  end

  def test_strip_whitspace
    assert_equal CodigoPostal.new("  04.094-050  "), CodigoPostal.new("04.094-050")
  end
end
