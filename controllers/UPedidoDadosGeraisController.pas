unit UPedidoDadosGeraisController;

interface

uses
   UDmVenda, UPedidoDadosGerais, System.SysUtils, Data.DB;

type
   IPedidoDadosGeraisController = interface
      function Getobj: TPedidoDadosGerais;

      procedure Setobj(const Value: TPedidoDadosGerais);
      function lstPedidoDadosGerais: OleVariant;
      function incluir(const Value: TPedidoDadosGerais): TPedidoDadosGerais;
      function alterar(const Value: TPedidoDadosGerais): TPedidoDadosGerais;
      function excluir(const Value: TPedidoDadosGerais): TPedidoDadosGerais;
      function BuscaPedido(const Value: TPedidoDadosGerais): TPedidoDadosGerais;

      property obj: TPedidoDadosGerais read Getobj write Setobj;

   end;

   TPedidoDadosGeraisController = class(TInterfacedObject, IPedidoDadosGeraisController)
   private
      Fobj: TPedidoDadosGerais;
      function Getobj: TPedidoDadosGerais;
      procedure Setobj(const Value: TPedidoDadosGerais);
   public
      function lstPedidoDadosGerais: OleVariant;
      function incluir(const Value: TPedidoDadosGerais): TPedidoDadosGerais;
      function alterar(const Value: TPedidoDadosGerais): TPedidoDadosGerais;
      function excluir(const Value: TPedidoDadosGerais): TPedidoDadosGerais;
      function BuscaPedido(const Value: TPedidoDadosGerais): TPedidoDadosGerais;

      property obj: TPedidoDadosGerais read Getobj write Setobj;
   end;
implementation

{ TPedidoDadosGeraisController }

function TPedidoDadosGeraisController.alterar(const Value: TPedidoDadosGerais): TPedidoDadosGerais;
begin
   dmVenda.BeginTran;
   try
      if (dmVenda.qryPedidoGerais.Locate('numero_pedido', Value.numeroPedido, [loCaseInsensitive])) then begin
         dmVenda.qryPedidoGerais.Edit;
         dmVenda.qryPedidoGerais.FieldByName('numero_pedido').Value  := Value.numeroPedido;
         dmVenda.qryPedidoGerais.FieldByName('data_emissao').Value   := Value.dataEmissao;
         dmVenda.qryPedidoGerais.FieldByName('codigo_cliente').Value := Value.cliente.codigo;
         dmVenda.qryPedidoGerais.FieldByName('valor_total').Value    := Value.valorTotal;
         dmVenda.qryPedidoGerais.Post;
      end;

      dmVenda.CommitTran;
   except on E: Exception do

      dmVenda.RollbackTran;
   end;

   Result := BuscaPedido(Value);


end;

function TPedidoDadosGeraisController.BuscaPedido(
  const Value: TPedidoDadosGerais): TPedidoDadosGerais;
var
  obj: TPedidoDadosGerais;
begin
   obj := TPedidoDadosGerais.Create;

   dmVenda.qryLstPedGer.Close;
   dmVenda.qryLstPedGer.ParamByName('data_emissao').Value := Value.dataEmissao;
   dmVenda.qryLstPedGer.ParamByName('codigo_cliente').Value := Value.cliente.codigo;
   dmVenda.qryLstPedGer.ParamByName('valor_total').Value := Value.valorTotal;

   dmVenda.cdsLstPedGer.Close;
   dmVenda.cdsLstPedGer.Open;
   if dmVenda.cdsLstPedGer.RecordCount > 0 then begin
      obj.numeroPedido := dmVenda.cdsLstPedGer.FieldByName('numero_pedido').Value;
   end;

   Result := obj;

end;

function TPedidoDadosGeraisController.excluir(const Value: TPedidoDadosGerais): TPedidoDadosGerais;
begin
   dmVenda.BeginTran;
   try
      if (dmVenda.qryPedidoGerais.Locate('numero_pedido', Value.numeroPedido, [loCaseInsensitive])) then begin
         dmVenda.qryPedidoGerais.Delete;
      end;

      dmVenda.CommitTran;
   except on E: Exception do

      dmVenda.RollbackTran;
   end;

   Result := BuscaPedido(Value);

end;

function TPedidoDadosGeraisController.Getobj: TPedidoDadosGerais;
begin
   Result := Fobj;
end;

function TPedidoDadosGeraisController.incluir(const Value: TPedidoDadosGerais): TPedidoDadosGerais;
const
   sql = 'INSERT INTO pedidos_dados_gerais(data_emissao, codigo_cliente, valor_total) '+
         'VALUES (:data_emissao, :codigo_cliente, :valor_total)';

begin
   dmVenda.BeginTran;
   try
      dmVenda.exPedGer.CommandText := sql;
      dmVenda.exPedGer.ParamByName('data_emissao').Value   := Value.dataEmissao;
      dmVenda.exPedGer.ParamByName('codigo_cliente').Value := Value.cliente.codigo;
      dmVenda.exPedGer.ParamByName('valor_total').Value    := Value.valorTotal;
      dmVenda.exPedGer.ExecSQL;

      dmVenda.CommitTran;
   except on E: Exception do

      dmVenda.RollbackTran;
   end;

   Result := BuscaPedido(Value);

end;

function TPedidoDadosGeraisController.lstPedidoDadosGerais: OleVariant;
begin
   dmVenda.qryPedidoGerais.Close;
   dmVenda.qryPedidoGerais.Open;

   Result := dmVenda.dspPedidoGerais.Data;

end;

procedure TPedidoDadosGeraisController.Setobj(const Value: TPedidoDadosGerais);
begin
  Fobj := Value;
end;

end.
