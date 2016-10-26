<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="Content-Language" content="pt-br">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Casa das Marmitas</title>

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/scripts.js"></script>
        <script type="text/javascript">
            $(function () {
                $('#formCadTamanho').submit(function (event) {
                    event.preventDefault(); // Prevent the form from submitting via the browser
                    var form = $(this);
                    $.ajax({
                        type: form.attr('method'),
                        url: form.attr('action'),
                        data: form.serialize()
                    }).done(function (data) {
                        // Optionally alert the user of success here...
                        alert(data);
                    }).fail(function (data) {
                        // Optionally alert the user of an error here...
                        alert(data);
                    });
                });
            });
            
            $(function () {
                $('#cancelar').click(function (event) {
                    $("#tamanhoId").val("");
                    $("#descricao").val("");
                })
            });
            
            $.get("jsp/consultaTamanhos.jsp", function (data, status) {
                $("#consTamanhos").html(data);
            });
            function excluir(id) {
                $.post("jsp/excluirTamanho.jsp", {id: id},
                        function (data, status) {
                            alert("Data: " + data + "\nStatus: " + status);
                        });
            }
            function editar(id) {
                $.post("jsp/excluirTamanho.jsp", {id: id},
                        function (data, status) {
                            alert("Data: " + data + "\nStatus: " + status);
                        });
            }
        </script>
    </head>
    <body>

        <div class="container-fluid">
            <div class="row">                
                <div class="col-md-12">
                    <jsp:include page="menu.jsp" />
                    <br>
                    <br>
                    <br>                        
                    <div class="alert alert-dismissable alert-success" hidden>                                                
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
                            ×
                        </button>
                        <h4>
                            Alert!
                        </h4> <strong>Warning!</strong> Best check yo self, you're not looking too good. <a href="#" class="alert-link">alert link</a>
                    </div>
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-6">
                            <form class="form-horizontal" id="formCadTamanho" name="formCadTamanho" action="jsp/testeVariaveis.jsp">
                                <fieldset>


                                    <!-- change col-sm-N to reflect how you would like your column spacing (http://getbootstrap.com/css/#forms-control-sizes) -->


                                    <!-- Form Name -->
                                    <legend>Cadastro de Tamanho</legend>

                                    <!-- Text input http://getbootstrap.com/css/#forms -->
                                    <div class="form-group form-group-sm">
                                        <label for="tamanhoId" class="control-label col-sm-2">Id</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="tamanhoId" name="tamanhoId" placeholder="0" readonly="" disabled="">

                                        </div>
                                    </div>
                                    <!-- Text input http://getbootstrap.com/css/#forms -->
                                    <div class="form-group form-group-sm">
                                        <label for="descricao" class="control-label col-sm-2">Descrição</label>
                                        <div class="col-sm-10">
                                            <input type="text" class="form-control" id="descricao" name="descricao" placeholder="" required="">

                                        </div>
                                    </div>
                                    <!-- Button Group http://getbootstrap.com/components/#btn-groups -->
                                    <div class="form-group">
                                        <label class="control-label col-sm-2"></label>
                                        <div class="text-right col-sm-10">
                                            <div id="salvarGroup" class="btn-group" role="group" aria-label="">
                                                <button type="submit" id="salvar" name="salvar" class="btn btn-success btn-sm" aria-label="Salvar">Salvar</button>
                                                <button type="button" id="cancelar" name="cancelar" class="btn btn-danger btn-sm" aria-label="Salvar">Cancelar</button>
                                            </div>

                                        </div>
                                    </div>


                                </fieldset>
                            </form>
                        </div>                        
                        <div class="col-md-4">
                        </div>                        
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-2"></div>
                        <div class="col-md-6" id="consTamanhos" name="consTamanhos">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>