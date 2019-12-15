<jsp:include page="topo.jsp"></jsp:include>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:if test="${u.administrador != 1}">
	<c:redirect url="/restricted/painel.jsp"></c:redirect>
</c:if>

${msgEmpresasImprime }

<form class="form-horizontal" id="atualizarEmpresasCupom"
	action="/topwinner/atualizarEmpresasCupomImpressao.winner"
	method="post">
	<fieldset>

		<!-- Form Name -->
		<legend>LISTA DE EMPRESAS | IMPRESSÃO DE CUPOM</legend>

		<!-- Multiple Checkboxes -->
		<div class="form-group table-responsive">
			<div class="col-md-12 table-responsive">
				<input type="text" id="inputHelpBlock"
					class="input-search form-control" aria-describedby="helpBlock"
					alt="lista-clientes"
					placeholder="Buscar pelo nome da coluna nesta tabela, pode ser CNPJ ou RAZÃO SOCIAL">

				<table class="table table-striped lista-clientes" id="minhaTabela">

					<tr>
						<th>CNPJ</th>
						<th>RAZÃO SOCIAL</th>
						<th>IMPRIME</th>
					</tr>
					<tbody>
						<c:forEach items="${listaEmpresas }" var="f">
							<tr>
								<td>${f.cnpj }</td>
								<td>${f.razaoSocial }</td>
								<td><c:if test="${f.imprime == 0}">
										<div class="checkbox">
											<label for="checkboxes"> <input type="checkbox"
												name="empresasCupom" id="checkboxes" value="${f.cnpj }">
											</label>
										</div>
									</c:if> <c:if test="${f.imprime == 1}">
										<div class="checkbox">
											<label for="checkboxes"> <input type="checkbox"
												name="empresasCupom" id="checkboxes" value="${f.cnpj }"
												checked>
											</label>
										</div>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>



		</div>

		<div class="col-md-6">
			<button id="singlebutton" name="atualizarEmpresasCupom"
				class="btn btn-primary">ATUALIZAR</button>
		</div>

	</fieldset>
</form>



<script type="text/javascript" src="jquery.quick.search.js"></script>

<script type="text/javascript">
	$(function() {
		$(".input-search").keyup(
				function() {
					//pega o css da tabela 
					var tabela = $(this).attr('alt');
					if ($(this).val() != "") {
						$("." + tabela + " tbody>tr").hide();
						$(
								"." + tabela + " td:contains-ci('"
										+ $(this).val() + "')").parent("tr")
								.show();
					} else {
						$("." + tabela + " tbody>tr").show();
					}
				});
	});
	$.extend($.expr[":"],
			{
				"contains-ci" : function(elem, i, match, array) {
					return (elem.textContent || elem.innerText
							|| $(elem).text() || "").toLowerCase().indexOf(
							(match[3] || "").toLowerCase()) >= 0;
				}
			});
</script>



<jsp:include page="rodape.jsp"></jsp:include>