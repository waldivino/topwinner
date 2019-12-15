<jsp:include page="topo.jsp"></jsp:include>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

${msgSolicitacoes }


<c:if test="${paginaBloqueada != 1 }">
	<c:redirect url="/restricted/painel.jsp"></c:redirect>
</c:if>

<c:if test="${fn:length(listaSolicitacoes) > 0}">

	<div class="alert alert-success">
		<h3>Solicita��es de novas empresas interessadas em abrir uma
			conta no TOP WINNER!</h3>
	</div>
	<table class="table table-striped">
		<tr>
			<th>ID</th>
			<th>CNPJ</th>
			<th>Raz�o social</th>
			<th>Telefone</th>
			<th>Celular</th>
			<th>Contato</th>
			<th></th>
			<th></th>
		</tr>
		<c:forEach items="${listaSolicitacoes }" var="f">
			<tr>
				<td>${f.idUser }</td>
				<td>${f.cnpj }</td>
				<td>${f.razaoSocial }</td>
				<td>${f.telefone }</td>
				<td>${f.celular }</td>
				<td>${f.contato }</td>
				<td>
					<form action="/topwinner/criarConta.winner" method="post">

						<input type="hidden" name="idUser" value="${f.idUser }"> <input
							type="hidden" name="cnpj" value="${f.cnpj }"> <input
							type="hidden" name="razaoSocial" value="${f.razaoSocial }">
						<input type="hidden" name="telefone" value="${f.telefone }">
						<input type="hidden" name="celular" value="${f.celular }">
						<input type="hidden" name="contato" value="${f.contato }">
						<input type="hidden" name="email" value="${f.email }"> <input
							type="submit" value="Criar
							Conta"
							class="btn btn-default btn-xs" />
					</form>
				</td>
				<td>
					<form action="/topwinner/descartar.winner" method="post">
						<input type="hidden" name="email" value="${f.email }"> <input
							type="submit" value="DESCARTAR" name="botao"
							class="btn btn-danger btn-xs"
							onclick="return confirm('Tem certeza que quer descartar esta solicita��o?')" />
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</c:if>


<c:if test="${fn:length(listaSolicitacoes) < 1}">
	<div class="alert alert-info" style="text-align: center;">
		<h2>N�o existem solicita��es de contas at� o momento.</h2>
	</div>
</c:if>

<jsp:include page="rodape.jsp"></jsp:include>