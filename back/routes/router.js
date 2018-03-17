let express = require('express');
let activity = require('../controls/activity');
let user = require('../controls/user_info');
let club = require('../controls/club');
let api = require('../api');
let upload = require('../utils/upload');


let router = express.Router();

// activity
router.get(api.activityList, activity.fetchAll);
router.post(api.activityDetail, activity.fetchById);
router.post(api.activityAdd, activity.addOne);
router.post(api.activityDelete, activity.deleteOne);


// club
router.get(api.clubList, club.fetchAll);
router.post(api.clubDetail, club.fetchById);
router.post(api.clubAdd, club.addOne);
router.post(api.joinClub, club.joinClub);
router.post(api.clubDelete, club.deleteOne);


// user
router.get(api.userList, user.fetchAll);
router.get(api.userLogout, user.logout);
router.get(api.userAutoLogin, user.autoLogin); // 自动登录

router.post(api.userDelete, user.deleteOne);
router.post(api.userLogin, user.login); // 登录
router.post(api.userRegister, user.register); // 注册

module.exports = router;