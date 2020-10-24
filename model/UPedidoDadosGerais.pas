unit UPedidoDadosGerais;

interface

uses
   Data.DB, Data.Win.ADODB, UCliente;

type
   TPedidoDadosGerais = class
  private
    FvalorTotal: Double;
    FdataEmissao: TDateTime;
    FnumeroPedido: Integer;
    Fcliente: TCliente;
    procedure SetdataEmissao(const Value: TDateTime);
    procedure SetnumeroPedido(const Value: Integer);
    procedure SetvalorTotal(const Value: Double);
    procedure Setcliente(const Value: TCliente);

   public
      constructor Create;
      destructor Destroy; override;

      property numeroPedido: Integer read FnumeroPedido write SetnumeroPedido;
      property dataEmissao: TDateTime read FdataEmissao write SetdataEmissao;
      property cliente: TCliente read Fcliente write Setcliente;
      property valorTotal: Double read FvalorTotal write SetvalorTotal;
   end;

implementation

{ TPedidoDadosGerais }

constructor TPedidoDadosGerais.Create;
begin
   inherited;
end;

destructor TPedidoDadosGerais.Destroy;
begin
  inherited;
end;

procedure TPedidoDadosGerais.Setcliente(const Value: TCliente);
begin
  Fcliente := Value;
end;

procedure TPedidoDadosGerais.SetdataEmissao(const Value: TDateTime);
begin
  FdataEmissao := Value;
end;

procedure TPedidoDadosGerais.SetnumeroPedido(const Value: Integer);
begin
  FnumeroPedido := Value;
end;

procedure TPedidoDadosGerais.SetvalorTotal(const Value: Double);
begin
  FvalorTotal := Value;
end;

end.
