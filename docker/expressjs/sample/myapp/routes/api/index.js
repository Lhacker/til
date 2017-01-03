var express = require('express');
var router = express.Router();

router = require('./hello')(router);
router = require('./hello_lineapi')(router);

module.exports = router;
