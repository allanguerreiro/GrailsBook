/**
 * Created by allan on 07/10/16.
 */

function submeterForm(novaAction) {
    document.getElementById('actionAlunos').action = novaAction;
    document.getElementById('actionAlunos').submit();
}

function mudarCidade() {
    document.getElementById('cidade').selectedIndex = 0;
    document.getElementById('regiao').selectedIndex = 0;
    document.getElementById('filtroAlunosPremiados').action = "list";
    document.getElementById('filtroAlunosPremiados').submit();
}

function checrSelecionadosParaChekingHotel(checkboxesStr) {
    var countSelecionados = 0;
    var formFound = false;
    for (var e = 0; e < document.getElementById('actionAlunos').elements.length; e++) {
        if (document.getElementById('actionAlunos').elements[e].type == 'checkbox' && (checkboxesStr == null || document.getElementById('actionAlunos').elements[e].name == checkboxesStr)) {
            if (document.getElementById('actionAlunos').elements[e].disabled == false && document.getElementById('actionAlunos').elements[e].checked == true) {
                countSelecionados++;
            }
        }
    } // for e.

    if (countSelecionados > 4 || countSelecionados <= 0) {
        alert('Selecione até 4 alunos para informar o quarto do Hotel.');
        return false;
    }
    return true;
}
$(function () {

    $('#divInformarQuarto').dialog({
        autoOpen: false,
        width: 600,
        modal: true,
        buttons: {
            "Alterar Nome": function () {
                var idCampoNome = document.getElementById('hdnIDCampoNome').value;
                document.getElementById(idCampoNome).focus();
                retornoValidacao = false;
                $(this).dialog("close");
            },
            "Prosseguir assim mesmo": function () {
                var idCampoNome = document.getElementById('hdnIDCampoNome').value;
                retornoValidacao = true;
                checarNome(idCampoNome);
                $(this).dialog("close");
            }
        }
    });
});

function checkAndUncheck(controllerObj, checkboxesStr) {
    var formFound = false;
    for (var e = 0; e < document.getElementById('actionBooks').elements.length; e++) {
        if (document.getElementById('actionBooks').elements[e].type == 'checkbox'
            && (checkboxesStr == null || document.getElementById('actionBooks').elements[e].name == checkboxesStr)) {
            document.getElementById('actionBooks').elements[e].checked = controllerObj.checked;
        }
    } // for e.
}