object frmPedidoVenda: TfrmPedidoVenda
  Left = 0
  Top = 0
  Caption = 'Pedido de Venda'
  ClientHeight = 535
  ClientWidth = 688
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox7: TGroupBox
    Left = 18
    Top = 18
    Width = 500
    Height = 47
    Caption = 'Cliente:  '
    TabOrder = 0
    object Splitter1: TSplitter
      Left = 87
      Top = 15
      Width = 10
      Height = 30
      ExplicitLeft = 76
      ExplicitHeight = 28
    end
    object edtNomeCli: TEdit
      AlignWithMargins = True
      Left = 100
      Top = 18
      Width = 395
      Height = 24
      Align = alClient
      ReadOnly = True
      TabOrder = 0
      ExplicitHeight = 21
    end
    object edtCodigoCli: TButtonedEdit
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 79
      Height = 24
      Align = alLeft
      Images = ilPadrao16
      ReadOnly = True
      RightButton.ImageIndex = 0
      RightButton.Visible = True
      TabOrder = 1
      Text = 'edtCodigoCli'
      OnExit = edtCodigoCliExit
      OnRightButtonClick = edtCodigoCliRightButtonClick
      ExplicitHeight = 21
    end
  end
  object GroupBox1: TGroupBox
    Left = 18
    Top = 71
    Width = 500
    Height = 47
    Caption = 'Produto:  '
    TabOrder = 1
    object Splitter2: TSplitter
      Left = 87
      Top = 15
      Width = 10
      Height = 30
      ExplicitLeft = 76
      ExplicitHeight = 28
    end
    object edtNomePro: TEdit
      AlignWithMargins = True
      Left = 100
      Top = 18
      Width = 395
      Height = 24
      Align = alClient
      ReadOnly = True
      TabOrder = 0
      ExplicitHeight = 21
    end
    object edtCodPro: TButtonedEdit
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 79
      Height = 24
      Align = alLeft
      Images = ilPadrao16
      ReadOnly = True
      RightButton.ImageIndex = 0
      RightButton.Visible = True
      TabOrder = 1
      Text = 'edtCodigo'
      OnExit = edtCodProExit
      OnRightButtonClick = edtCodProRightButtonClick
      ExplicitHeight = 21
    end
  end
  object GroupBox2: TGroupBox
    Left = 18
    Top = 119
    Width = 94
    Height = 47
    Caption = 'Qtd:'
    TabOrder = 2
    object edtQtd: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 84
      Height = 24
      Align = alClient
      TabOrder = 0
      Text = 'edtQtd'
      ExplicitHeight = 21
    end
  end
  object GroupBox3: TGroupBox
    Left = 118
    Top = 119
    Width = 185
    Height = 47
    Caption = 'Vlr.Unitario:'
    TabOrder = 3
    object edtVrUnit: TEdit
      AlignWithMargins = True
      Left = 5
      Top = 18
      Width = 175
      Height = 24
      Align = alClient
      ReadOnly = True
      TabOrder = 0
      Text = 'Edit1'
      ExplicitHeight = 21
    end
  end
  object Panel1: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 471
    Width = 682
    Height = 61
    Align = alBottom
    TabOrder = 4
    object GroupBox4: TGroupBox
      Left = 496
      Top = 1
      Width = 185
      Height = 59
      Align = alRight
      Caption = 'Valor Total:'
      TabOrder = 0
      object edtTotalGeral: TEdit
        AlignWithMargins = True
        Left = 5
        Top = 18
        Width = 175
        Height = 36
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = 'edtTotalGeral'
        ExplicitHeight = 32
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 215
    Width = 688
    Height = 253
    Align = alBottom
    TabOrder = 5
    object dbgItens: TDBGrid
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 680
      Height = 245
      Align = alClient
      DataSource = dsPedidoProduto
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnKeyDown = dbgItensKeyDown
      Columns = <
        item
          Expanded = False
          FieldName = 'id'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'codigo_produto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'produto'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'quantidade'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_unitario'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'valor_total'
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 174
    Width = 688
    Height = 41
    Align = alBottom
    TabOrder = 6
    object btnAdd: TButton
      Left = 1
      Top = 1
      Width = 75
      Height = 39
      Align = alLeft
      Caption = 'Add'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = btnAddClick
    end
    object btnGravaPedido: TButton
      Left = 526
      Top = 1
      Width = 161
      Height = 39
      Align = alRight
      Caption = 'GravaPedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = btnGravaPedidoClick
    end
  end
  object dsCliente: TDataSource
    DataSet = cdsCliente
    Left = 128
    Top = 280
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 128
    Top = 328
  end
  object dsPedidoGerais: TDataSource
    DataSet = cdsPedidoGerais
    Left = 128
    Top = 376
  end
  object dsPedidoProduto: TDataSource
    DataSet = cdsPedidoProduto
    Left = 128
    Top = 424
  end
  object cdsCliente: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 36
    Top = 280
    object cdsClientecodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
    end
    object cdsClientenome: TStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 100
    end
    object cdsClientecidade: TStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 100
    end
    object cdsClienteuf: TStringField
      DisplayLabel = 'UF'
      FieldName = 'uf'
      Size = 2
    end
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 36
    Top = 328
    object cdsProdutocodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Required = True
    end
    object cdsProdutodescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 100
    end
    object cdsProdutopreco_venda: TFloatField
      DisplayLabel = 'Pre'#231'o Venda'
      FieldName = 'preco_venda'
    end
  end
  object cdsPedidoGerais: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 36
    Top = 376
    object cdsPedidoGeraisnumero_pedido: TIntegerField
      DisplayLabel = 'Numero Pedido'
      FieldName = 'numero_pedido'
      Required = True
    end
    object cdsPedidoGeraisdata_emissao: TDateField
      DisplayLabel = 'Data Emiss'#227'o'
      FieldName = 'data_emissao'
    end
    object cdsPedidoGeraiscodigo_cliente: TIntegerField
      DisplayLabel = 'C'#243'digo Cliente'
      FieldName = 'codigo_cliente'
    end
    object cdsPedidoGeraisvalor_total: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor_total'
    end
  end
  object cdsPedidoProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 36
    Top = 424
    object cdsPedidoProdutoid: TIntegerField
      DisplayLabel = 'Iid'
      FieldName = 'id'
      Required = True
    end
    object cdsPedidoProdutonumero_pedido: TIntegerField
      DisplayLabel = 'Numero Pedido'
      FieldName = 'numero_pedido'
    end
    object cdsPedidoProdutocodigo_produto: TIntegerField
      DisplayLabel = 'C'#243'digo Produto'
      FieldName = 'codigo_produto'
    end
    object cdsPedidoProdutoproduto: TStringField
      FieldName = 'produto'
      Size = 100
    end
    object cdsPedidoProdutoquantidade: TIntegerField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
    end
    object cdsPedidoProdutovalor_unitario: TFloatField
      DisplayLabel = 'Valor Unitario'
      FieldName = 'valor_unitario'
    end
    object cdsPedidoProdutovalor_total: TFloatField
      DisplayLabel = 'Valor Total'
      FieldName = 'valor_total'
    end
  end
  object ilPadrao16: TImageList
    Left = 208
    Top = 424
    Bitmap = {
      494C010101000800680010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFFFF314B6200AC7D7E00FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005084B2000F6FE100325F8C00B87E
      7A00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000032A0FE0037A1FF00106FE200325F
      8B00B67D7900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFF37A4FE00379FFF000E6D
      DE00355F8900BB7F7900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF37A4FE00359E
      FF000F6FDE0035608B00A67B7F00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF38A5
      FE00329DFF00156DCE00444F5B00FFFFFFFF9C6B6500AF887B00AF887E00AA80
      7500FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF3BABFF00A1CAE700AD867900A9837300E0CFB100FFFFDA00FFFFDD00FCF8
      CF00CCB29F00A1746B00FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFC0917D00FCE9AC00FFFFCC00FFFFCF00FFFFD000FFFF
      DE00FFFFFA00E3D3D10099696500FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFB0897800FAD19200FEF4C200FFFFD000FFFFDA00FFFF
      F600FFFFFC00FFFFFC00B6938400FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB0897800FEDA9700EDB47800FBEEBB00FFFFD300FFFFDC00FFFF
      F400FFFFF400FFFFE200E9DDBC00A67B73000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFB18A7800FFDE9900E9A16700F4D19900FEFCCC00FFFFD500FFFF
      DA00FFFFDC00FFFFD700EFE6C500A97E75000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFAA7F7300FAE0A400F0B77800EEBA7B00F6DDA600FEFBCC00FFFF
      D300FFFFD100FFFFD700D9C5A700A3756C000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFCEB29300FFFEDD00F4D1A500EEBA7B00F2C78F00F8E1
      AB00FCF0BA00FCFACA00A3776F00FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFA1746B00E1D4D300FFFEEE00F7CC8C00F0B47300F7C7
      8800FCE3A500C2A08800A5776C00FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF98686500BA958700EAD7A400EAD59E00E0C0
      9700A5776C00A5776C00FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA77E7000A9807300A478
      6E00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
end