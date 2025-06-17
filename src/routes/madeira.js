var express = require("express");
var router = express.Router();

var madeiraController = require("../controllers/madeiraController");

router.get("/ultimas/:idSensor", function (req, res) {
    madeiraController.buscarUltimasMedidas(req, res);
});
 

module.exports = router;