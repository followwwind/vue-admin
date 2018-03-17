let sql = require('../sql/sql');
let moment = require('moment');
let bcrypt = require('bcryptjs');
let func = require('../sql/func');

function formatData(rows) {
    return rows.map(row => {
        let date = moment(row.create_time).format('YYYY-MM-DD');
        let obj = {};

        delete row.password;

        return Object.assign({}, row, {create_time: date}, obj);
    });
}

module.exports = {

    fetchAll (req, res) {
        func.connPool(sql.queryAll, 'club', (err, rows) => {
            rows = formatData(rows);
            res.json({code: 200, msg: 'ok', clubs: rows});
        });

    },

    // 添加社团
    addOne (req, res) {
        let name = req.body.name;
        let info = req.body.info;
        let count = req.body.count;
        let creator = req.body.creator;
        let query = 'INSERT INTO club(name, info, count, creator) VALUES(?, ?, ?, ?)';

        let arr = [name, info, count, creator];

        func.connPool(query, arr, (err, rows) => {
            res.json({code: 200, msg: 'done'});
        });

    },

    fetchById (req, res){
        let id = req.body.id;
        let result = {};
        func.connPool("SELECT * FROM club where id", [id], (err, rows) => {
            result.club = rows[0];

            func.connPool("SELECT * FROM club_user where club_id", [id], (err, rows) => {
                result.clubPersons = formatData(rows);
                res.json({code: 200, msg: 'ok', club: result});
            });
        });
    },

    //加入社团
    joinClub (req, res) {
        let club_id = req.body.club_id;
        let user_id = req.body.user_id
        let query = 'INSERT INTO club_user(club_id, user_id) VALUES(?, ?)';
        let arr = [club_id, user_id];

        func.connPool(query, arr, rows => {
            res.json({code: 200, msg: 'done'});
        });

    },


    // 删除用户
    deleteOne (req, res) {

        let id = req.body.id;

        func.connPool(sql.del, ['club', id], rows => {
            res.json({code: 200, msg: 'done'});
        });

    },

    // 批量删除
    deleteMulti (req, res) {
        let id = req.body.id;

        func.connPool('DELETE FROM club WHERE id IN ?', [[id]], rows => {
            res.json({code: 200, msg: 'done'});
        });

    }
};