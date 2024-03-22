const router = require('express').Router();
const ChildController = require("../controller/child.controller");
const { authenticate } = require("../middleware/auth.middleware"); 


router.post('/', authenticate, ChildController.addChild);
router.get('/:childId', authenticate, ChildController.getChildInfo);
router.delete('/:childId', authenticate, ChildController.deleteChild);

module.exports = router;
