var database = require("../database/config");

function buscarUltimasMedidas(idSensor) {

    var instrucaoSql = `
    SELECT l.tipo, r.medida, r.horario
FROM lote l
JOIN sensor s on s.fk_lote = l.id
JOIN registro r on r.fk_sensor = s.id where s.id = ${idSensor}
ORDER BY s.id DESC LIMIT 10;
    `;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql);
}

module.exports = {
    buscarUltimasMedidas
    
}
