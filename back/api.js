let path = '/api';

module.exports = {
    // activity
    activityList: path + '/activity/list',
    activityDetail: path + '/activity/detail',
    activityDelete: path + '/activity/delete',
    activityAdd: path + '/activity/add',

    //club
    clubList: path + '/club/list',
    clubDetail: path + '/club/detail',
    clubDelete: path + '/club/delete',
    joinClub: path + '/club/joinClub',
    clubAdd: path + '/club/add',
    

    // user
    userList: path + '/user/list',
    userDelete: path + '/user/delete',
    userRegister: path + '/user/register',
    userLogin: path + '/user/login',
    userLogout: path + '/user/logout',
    userAutoLogin: path + '/user/auto-login'
};