program PedidoVenda;

uses
  Vcl.Forms,
  UfrmPedidoVenda in 'view\UfrmPedidoVenda.pas' {frmPedidoVenda},
  UCliente in 'model\UCliente.pas',
  UProduto in 'model\UProduto.pas',
  UPedidoDadosGerais in 'model\UPedidoDadosGerais.pas',
  UPedidoProduto in 'model\UPedidoProduto.pas',
  UDmVenda in 'dados\UDmVenda.pas' {dmVenda: TDataModule},
  UClienteController in 'controllers\UClienteController.pas',
  UProdutoController in 'controllers\UProdutoController.pas',
  UPedidoDadosGeraisController in 'controllers\UPedidoDadosGeraisController.pas',
  UPedidoProdutoController in 'controllers\UPedidoProdutoController.pas',
  UFrmPesquisa in 'view\UFrmPesquisa.pas' {FrmPesquisa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmVenda, dmVenda);
  Application.CreateForm(TfrmPedidoVenda, frmPedidoVenda);
  Application.Run;
end.
