unit UPedidoProduto;

interface

uses
   UProduto, UPedidoDadosGerais, Data.DB, Data.Win.ADODB;

type
   TPedidoProduto = class
  private
    FvalorUnitario: Double;
    Fid: Integer;
    FvalorTotal: Double;
    Fquantidade: Integer;
    FcodigoProduto: TProduto;
    FnumeroPedido: TPedidoDadosGerais;
    procedure Setid(const Value: Integer);
    procedure Setquantidade(const Value: Integer);
    procedure SetvalorTotal(const Value: Double);
    procedure SetvalorUnitario(const Value: Double);
    procedure SetcodigoProduto(const Value: TProduto);
    procedure SetnumeroPedido(const Value: TPedidoDadosGerais);

   public
      constructor Create;
      destructor Destroy; override;

      property id: Integer read Fid write Setid;
      property numeroPedido: TPedidoDadosGerais read FnumeroPedido write SetnumeroPedido;
      property codigoProduto: TProduto read FcodigoProduto write SetcodigoProduto;
      property quantidade: Integer read Fquantidade write Setquantidade;
      property valorUnitario: Double read FvalorUnitario write SetvalorUnitario;
      property valorTotal: Double read FvalorTotal write SetvalorTotal;
end;

implementation

{ TPedidoProduto }


constructor TPedidoProduto.Create;
begin
   inherited;
end;

destructor TPedidoProduto.Destroy;
begin

  inherited;
end;

procedure TPedidoProduto.SetcodigoProduto(const Value: TProduto);
begin
  FcodigoProduto := Value;
end;

procedure TPedidoProduto.Setid(const Value: Integer);
begin
  Fid := Value;
end;

procedure TPedidoProduto.SetnumeroPedido(const Value: TPedidoDadosGerais);
begin
  FnumeroPedido := Value;
end;


procedure TPedidoProduto.Setquantidade(const Value: Integer);
begin
  Fquantidade := Value;
end;

procedure TPedidoProduto.SetvalorTotal(const Value: Double);
begin
  FvalorTotal := Value;
end;

procedure TPedidoProduto.SetvalorUnitario(const Value: Double);
begin
  FvalorUnitario := Value;
end;

end.
