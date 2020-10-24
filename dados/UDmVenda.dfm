object dmVenda: TdmVenda
  OldCreateOrder = False
  Height = 429
  Width = 610
  object con: TSQLConnection
    ConnectionName = 'MySQLConnection'
    DriverName = 'MySQL'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=MySQL'
      'HostName=localhost'
      'Database=venda'
      'User_Name=lixo'
      'Password=root'
      'ServerCharSet='
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Compressed=False'
      'Encrypted=False'
      'ConnectTimeout=60')
    Connected = True
    Left = 72
    Top = 32
  end
  object qryCliente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT codigo, nome, cidade, uf FROM clientes')
    SQLConnection = con
    Left = 368
    Top = 120
    object qryClientecodigo: TIntegerField
      DisplayLabel = 'c'#243'digo'
      FieldName = 'codigo'
      Required = True
    end
    object qryClientenome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 100
    end
    object qryClientecidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 100
    end
    object qryClienteuf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Size = 2
    end
  end
  object qryProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT codigo, descricao, preco_venda FROM produtos')
    SQLConnection = con
    Left = 368
    Top = 184
    object qryProdutocodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
    end
    object qryProdutodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 100
    end
    object qryProdutopreco_venda: TFloatField
      DisplayLabel = 'Pre'#231'o Venda'
      FieldName = 'preco_venda'
    end
  end
  object qryPedidoGerais: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT numero_pedido, data_emissao, codigo_cliente, valor_total ' +
        'FROM pedidos_dados_gerais')
    SQLConnection = con
    Left = 368
    Top = 240
    object qryPedidoGeraisnumero_pedido: TIntegerField
      DisplayLabel = 'Numero Pedido'
      FieldName = 'numero_pedido'
      Required = True
    end
    object qryPedidoGeraisdata_emissao: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'data_emissao'
    end
    object qryPedidoGeraiscodigo_cliente: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'codigo_cliente'
    end
    object qryPedidoGeraisvalor_total: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor_total'
    end
  end
  object qryPedidoProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      
        'SELECT id, numero_pedido, codigo_produto, quantidade, valor_unit' +
        'ario, valor_total, '#39#39' as produto '
      'FROM pedidos_produtos')
    SQLConnection = con
    Left = 368
    Top = 296
    object qryPedidoProdutoid: TIntegerField
      DisplayLabel = 'Iid'
      FieldName = 'id'
      Required = True
    end
    object qryPedidoProdutonumero_pedido: TIntegerField
      DisplayLabel = 'Numero Pedido'
      FieldName = 'numero_pedido'
    end
    object qryPedidoProdutocodigo_produto: TIntegerField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'codigo_produto'
    end
    object qryPedidoProdutoproduto: TStringField
      FieldName = 'produto'
      Required = True
      Size = 100
    end
    object qryPedidoProdutoquantidade: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object qryPedidoProdutovalor_unitario: TFloatField
      DisplayLabel = 'Valor Unitario'
      FieldName = 'valor_unitario'
    end
    object qryPedidoProdutovalor_total: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor_total'
    end
  end
  object dspCliente: TDataSetProvider
    DataSet = qryCliente
    Left = 464
    Top = 120
  end
  object dspProduto: TDataSetProvider
    DataSet = qryProduto
    Left = 464
    Top = 184
  end
  object dspPedidoGerais: TDataSetProvider
    DataSet = qryPedidoGerais
    Left = 464
    Top = 240
  end
  object dspPedidoProduto: TDataSetProvider
    DataSet = qryPedidoProduto
    Left = 464
    Top = 296
  end
  object qryLstPedPro: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'Pnumero_pedido'
        ParamType = ptInput
      end>
    SQL.Strings = (
      
        'SELECT id, numero_pedido, codigo_produto, quantidade, valor_unit' +
        'ario, valor_total FROM pedidos_produtos'
      'where numero_pedido = :Pnumero_pedido')
    SQLConnection = con
    Left = 256
    Top = 296
    object IntegerField1: TIntegerField
      DisplayLabel = 'Iid'
      FieldName = 'id'
      Required = True
    end
    object IntegerField2: TIntegerField
      DisplayLabel = 'Numero Pedido'
      FieldName = 'numero_pedido'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'codigo_produto'
    end
    object IntegerField4: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object qryLstPedProvalor_unitario: TFloatField
      FieldName = 'valor_unitario'
    end
    object qryLstPedProvalor_total: TFloatField
      FieldName = 'valor_total'
    end
  end
  object qryLstPedGer: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftDate
        Name = 'data_emissao'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'codigo_cliente'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'valor_total'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT numero_pedido, data_emissao, codigo_cliente, valor_total '
      'FROM pedidos_dados_gerais'
      'where data_emissao = :data_emissao'
      'and codigo_cliente = :codigo_cliente'
      'and valor_total = :valor_total')
    SQLConnection = con
    Left = 256
    Top = 240
    object IntegerField5: TIntegerField
      DisplayLabel = 'Numero Pedido'
      FieldName = 'numero_pedido'
      Required = True
    end
    object DateField1: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'data_emissao'
    end
    object IntegerField6: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'codigo_cliente'
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor_total'
    end
  end
  object exPedGer: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = con
    Left = 552
    Top = 240
  end
  object exPedPro: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = con
    Left = 552
    Top = 296
  end
  object dspLstPedGer: TDataSetProvider
    DataSet = qryLstPedGer
    Left = 176
    Top = 240
  end
  object dspLstPedPro: TDataSetProvider
    DataSet = qryLstPedPro
    Left = 176
    Top = 296
  end
  object cdsLstPedGer: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLstPedGer'
    Left = 104
    Top = 240
  end
  object cdsLstPedPro: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLstPedPro'
    Left = 104
    Top = 296
  end
  object qryLstProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'codigo'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT codigo, descricao, preco_venda '
      'FROM produtos'
      'where codigo = :codigo')
    SQLConnection = con
    Left = 256
    Top = 184
    object qryLstProdutocodigo: TIntegerField
      FieldName = 'codigo'
      Required = True
    end
    object qryLstProdutodescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object qryLstProdutopreco_venda: TFloatField
      FieldName = 'preco_venda'
    end
  end
  object dspLstProduto: TDataSetProvider
    DataSet = qryLstProduto
    Left = 168
    Top = 184
  end
  object cdsLstProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspLstProduto'
    Left = 96
    Top = 184
  end
end
