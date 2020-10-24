unit UDmVenda;

interface

uses
  System.SysUtils, System.Classes, Data.DBXMySQL, Data.DB, Data.SqlExpr,
  Data.FMTBcd, Datasnap.Provider, Data.DBXCommon, Datasnap.DBClient;

type
  TdmVenda = class(TDataModule)
    con: TSQLConnection;
    qryCliente: TSQLQuery;
    qryProduto: TSQLQuery;
    qryPedidoGerais: TSQLQuery;
    qryPedidoProduto: TSQLQuery;
    qryClientecodigo: TIntegerField;
    qryClientenome: TStringField;
    qryClientecidade: TStringField;
    qryClienteuf: TStringField;
    qryProdutocodigo: TIntegerField;
    qryProdutodescricao: TStringField;
    qryPedidoProdutoid: TIntegerField;
    qryPedidoProdutonumero_pedido: TIntegerField;
    qryPedidoProdutocodigo_produto: TIntegerField;
    qryPedidoProdutoquantidade: TIntegerField;
    qryPedidoGeraisnumero_pedido: TIntegerField;
    qryPedidoGeraisdata_emissao: TDateField;
    qryPedidoGeraiscodigo_cliente: TIntegerField;
    dspCliente: TDataSetProvider;
    dspProduto: TDataSetProvider;
    dspPedidoGerais: TDataSetProvider;
    dspPedidoProduto: TDataSetProvider;
    qryLstPedPro: TSQLQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    qryLstPedProvalor_unitario: TFloatField;
    qryLstPedProvalor_total: TFloatField;
    qryProdutopreco_venda: TFloatField;
    qryPedidoGeraisvalor_total: TFloatField;
    qryPedidoProdutovalor_unitario: TFloatField;
    qryPedidoProdutovalor_total: TFloatField;
    qryPedidoProdutoproduto: TStringField;
    qryLstPedGer: TSQLQuery;
    IntegerField5: TIntegerField;
    DateField1: TDateField;
    IntegerField6: TIntegerField;
    FloatField1: TFloatField;
    exPedGer: TSQLDataSet;
    exPedPro: TSQLDataSet;
    dspLstPedGer: TDataSetProvider;
    dspLstPedPro: TDataSetProvider;
    cdsLstPedGer: TClientDataSet;
    cdsLstPedPro: TClientDataSet;
    qryLstProduto: TSQLQuery;
    dspLstProduto: TDataSetProvider;
    cdsLstProduto: TClientDataSet;
    qryLstProdutocodigo: TIntegerField;
    qryLstProdutodescricao: TStringField;
    qryLstProdutopreco_venda: TFloatField;
  private
    { Private declarations }
    Ftransacao: TDBXTransaction;
  public
    { Public declarations }
    procedure BeginTran;
    procedure CommitTran;
    procedure RollbackTran;


  end;

var
  dmVenda: TdmVenda;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmVenda }

procedure TdmVenda.BeginTran;
begin
   Self.Ftransacao := con.BeginTransaction(TDBXIsolations.ReadCommitted);
end;

procedure TdmVenda.CommitTran;
begin
   con.CommitFreeAndNil(Self.Ftransacao);
end;

procedure TdmVenda.RollbackTran;
begin
   Self.con.RollbackFreeAndNil(Self.Ftransacao);

end;

end.
