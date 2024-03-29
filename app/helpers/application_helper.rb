module ApplicationHelper

  ACCOUNT_TYPES = [
    { key: "CC", value: "Conta Corrente" },
    { key: "CP", value: "Conta Poupança" },
  ]

  BANKING_NAME = [
    { key: "654", value: "654 - BANCO A.J. RENNER S.A." },
    { key: "246", value: "246 - BANCO ABC BRASIL S.A." },
    { key: "356", value: "356 - BANCO ABN AMRO REAL S.A." },
    { key: "25", value: "025 - BANCO ALFA S/A." },
    { key: "213", value: "213 - BANCO ARBI S.A." },
    { key: "29", value: "029 - BANCO BANERJ S.A." },
    { key: "719", value: "719 - BANCO BANIF PRIMUS S.A." },
    { key: "107", value: "107 - BANCO BBM S.A." },
    { key: "291", value: "291 - BANCO BCN S.A." },
    { key: "34", value: "034 - BANCO BEA S.A." },
    { key: "48", value: "048 - BANCO BEMGE S.A." },
    { key: "739", value: "739 - BANCO BGN S.A." },
    { key: "96", value: "096 - BANCO BM&amp;F DE SERV. DE LIQUIDAÇÃO E CUSTODIA S.A." },
    { key: "394", value: "394 - BANCO BMC S.A." },
    { key: "318", value: "318 - BANCO BMG S.A." },
    { key: "752", value: "752 - BANCO BNP PARIBAS BRASIL S.A." },
    { key: "231", value: "231 - BANCO BOAVISTA INTERATLANTICO S.A-EM ABSORCAO" },
    { key: "237", value: "237 - BANCO BRADESCO S.A." },
    { key: "225", value: "225 - BANCO BRASCAN S.A." },
    { key: "218", value: "218 - BANCO BS2 S.A" },
    { key: "44", value: "044 - BANCO BVA SA" },
    { key: "336", value: "336 - BANCO C6 S.A." },
    { key: "263", value: "263 - BANCO CACIQUE S.A." },
    { key: "222", value: "222 - BANCO CALYON BRASIL S/A" },
    { key: "412", value: "412 - BANCO CAPITAL S.A." },
    { key: "266", value: "266 - BANCO CEDULA S.A." },
    { key: "745", value: "745 - BANCO CITIBANK S.A." },
    { key: "215", value: "215 - BANCO COMERCIAL E DE INVESTIMENTO SUDAMERIS S.A" },
    { key: "753", value: "753 - BANCO COMERCIAL URUGUAI S.A." },
    { key: "756", value: "756 - BANCO COOPERATIVO DO BRASIL S.A." },
    { key: "748", value: "748 - BANCO COOPERATIVO SICREDI S.A." },
    { key: "721", value: "721 - BANCO CREDIBEL S.A." },
    { key: "505", value: "505 - BANCO CREDIT SUISSE FIRST BOSTON S.A." },
    { key: "229", value: "229 - BANCO CRUZEIRO DO SUL S.A." },
    { key: "3", value: "003 - BANCO DA AMAZONIA S.A." },
    { key: "707", value: "707 - BANCO DAYCOVAL S.A." },
    { key: "495", value: "495 - BANCO DE LA PROVINCIA DE BUENOS AIRES" },
    { key: "494", value: "494 - BANCO DE LA REPUBLICA ORIENTAL DEL URUGUAY" },
    { key: "24", value: "024 - BANCO DE PERNAMBUCO S.A.-BANDEPE" },
    { key: "456", value: "456 - BANCO DE TOKYO MITSUBISHI BRASIL S.A." },
    { key: "214", value: "214 - BANCO DIBENS S.A." },
    { key: "1", value: "001 - BANCO DO BRASIL S.A." },
    { key: "27", value: "027 - BANCO DO ESTADO DE SANTA CATARINA S.A." },
    { key: "47", value: "047 - BANCO DO ESTADO DE SERGIPE S.A." },
    { key: "35", value: "035 - BANCO DO ESTADO DO CEARA S.A. BEC" },
    { key: "36", value: "036 - BANCO DO ESTADO DO MARANHAO S.A.-BEM" },
    { key: "37", value: "037 - BANCO DO ESTADO DO PARA S.A." },
    { key: "39", value: "039 - BANCO DO ESTADO DO PIAUI S.A.-BEP" },
    { key: "41", value: "041 - BANCO DO ESTADO DO RIO GRANDE DO SUL S.A." },
    { key: "4", value: "004 - BANCO DO NORDESTE DO BRASIL S.A." },
    { key: "743", value: "743 - BANCO EMBLEMA S.A." },
    { key: "265", value: "265 - BANCO FATOR S.A." },
    { key: "224", value: "224 - BANCO FIBRA S.A." },
    { key: "626", value: "626 - BANCO FICSA S.A." },
    { key: "175", value: "175 - BANCO FINASA S.A." },
    { key: "252", value: "252 - BANCO FININVEST S.A." },
    { key: "233", value: "233 - BANCO GE CAPITAL S.A." },
    { key: "612", value: "612 - BANCO GUANABARA S.A." },
    { key: "63", value: "063 - BANCO IBI S.A - BANCO MULTIPLO" },
    { key: "604", value: "604 - BANCO INDUSTRIAL DO BRASIL S.A." },
    { key: "320", value: "320 - BANCO INDUSTRIAL E COMERCIAL S.A." },
    { key: "653", value: "653 - BANCO INDUSVAL S.A." },
    { key: "77", value: "077 - BANCO INTER S.A." },
    { key: "630", value: "630 - BANCO INTERCAP S.A." },
    { key: "249", value: "249 - BANCO INVESTCRED UNIBANCO S.A." },
    { key: "341", value: "341 - BANCO ITAU S.A." },
    { key: "74", value: "074 - BANCO J. SAFRA S.A." },
    { key: "217", value: "217 - BANCO JOHN DEERE S.A." },
    { key: "600", value: "600 - BANCO LUSO BRASILEIRO S.A." },
    { key: "212", value: "212 - BANCO MATONE S.A." },
    { key: "243", value: "243 - BANCO MAXIMA S.A." },
    { key: "389", value: "389 - BANCO MERCANTIL DO BRASIL S.A." },
    { key: "746", value: "746 - BANCO MODAL S.A." },
    { key: "738", value: "738 - BANCO MORADA S.A." },
    { key: "151", value: "151 - BANCO NOSSA CAIXA S.A." },
    { key: "45", value: "045 - BANCO OPPORTUNITY S.A." },
    { key: "208", value: "208 - BANCO PACTUAL S.A." },
    { key: "623", value: "623 - BANCO PANAMERICANO S.A." },
    { key: "611", value: "611 - BANCO PAULISTA S.A." },
    { key: "650", value: "650 - BANCO PEBB S.A." },
    { key: "613", value: "613 - BANCO PECUNIA S.A." },
    { key: "643", value: "643 - BANCO PINE S.A." },
    { key: "735", value: "735 - BANCO POTTENCIAL S.A." },
    { key: "638", value: "638 - BANCO PROSPER S.A." },
    { key: "747", value: "747 - BANCO RABOBANK INTERNATIONAL BRASIL S.A." },
    { key: "216", value: "216 - BANCO REGIONAL MALCON S.A." },
    { key: "633", value: "633 - BANCO RENDIMENTO S.A." },
    { key: "741", value: "741 - BANCO RIBEIRAO PRETO S.A." },
    { key: "453", value: "453 - BANCO RURAL S.A." },
    { key: "422", value: "422 - BANCO SAFRA S.A." },
    { key: "33", value: "033 - BANCO SANTANDER S.A." },
    { key: "250", value: "250 - BANCO SCHAHIN S.A." },
    { key: "366", value: "366 - BANCO SOCIETE GENERALE BRASIL S.A." },
    { key: "637", value: "637 - BANCO SOFISA S.A." },
    { key: "347", value: "347 - BANCO SUDAMERIS DO BRASIL S.A." },
    { key: "464", value: "464 - BANCO SUMITOMO MITSUI BRASILEIRO S.A." },
    { key: "634", value: "634 - BANCO TRIANGULO S.A." },
    { key: "247", value: "247 - BANCO UBS S.A." },
    { key: "655", value: "655 - BANCO VOTORANTIM S.A." },
    { key: "610", value: "610 - BANCO VR S.A." },
    { key: "370", value: "370 - BANCO WESTLB DO BRASIL S.A." },
    { key: "219", value: "219 - BANCO ZOGBI S.A." },
    { key: "62", value: "062 - BANCO1.NET S.A." },
    { key: "28", value: "028 - BANEB-EM ABSORCAO" },
    { key: "21", value: "021 - BANESTES S.A BANCO DO ESTADO DO ESPIRITO SANTO" },
    { key: "479", value: "479 - BANKBOSTON BANCO MULTIPLO S.A." },
    { key: "73", value: "073 - BB BANCO POPULAR DO BRASIL" },
    { key: "749", value: "749 - BR BANCO MERCANTIL S.A." },
    { key: "70", value: "070 - BRB - BANCO DE BRASILIA S.A." },
    { key: "104", value: "104 - CAIXA ECONOMICA FEDERAL" },
    { key: "85", value: "085 - COOPERATIVA CENTRAL DE CRéDITO - AILOS" },
    { key: "487", value: "487 - DEUTSCHE BANK S. A. - BANCO ALEMAO" },
    { key: "210", value: "210 - DRESDNER BANK LATEINAMERIKA AKTIENGESELLSCHAFT" },
    { key: "399", value: "399 - HSBC BANK BRASIL S.A" },
    { key: "76", value: "076 - KDB DO BRASIL" },
    { key: "65", value: "065 - LEMON BANK BANCO MULTIPLO S.A." },
    { key: "260", value: "260 - NU PAGAMENTOS S.A." },
    { key: "290", value: "290 - PAGSEGURO INTERNET S.A" },
    { key: "30", value: "030 - PARAIBAN-BANCO DA PARAIBA S.A." },
    { key: "254", value: "254 - PARANA BANCO S.A." },
    { key: "409", value: "409 - UNIBANCO - UNIAO DE BANCOS BRASILEIROS S.A." },
    { key: "230", value: "230 - UNICARD BANCO MULTIPLO S.A." },
  ]

  def presenter(model)
    klass = "#{model.class}Presenter".constantize
    instance = klass.new(model)
    yield(instance) if block_given?
  end

  def currency_formatted(amount)
    return "R$ 0,00" unless valid_float?(amount)

    number_to_currency(amount, locale: :"pt-BR", precision: 2, unit: "R$\s", separetor: ".", delimiter: ",")
  end

  def banking_account_type_helper
    ACCOUNT_TYPES.map { |p| [p[:value], p[:key]] }
  end

  def banking_names_helper
    BANKING_NAME.map { |p| [p[:value], p[:key]] }
  end

  def human_attribute_enum(model_name, enum_attr, attr_name)
    Hash[enum_attr.map { |k,v| [I18n.t("activerecord.attributes.#{model_name}/#{attr_name}.#{k}"), k] }]
  end
end
