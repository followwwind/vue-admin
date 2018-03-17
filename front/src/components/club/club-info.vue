<template>
    <div>
        <el-form ref="form" :model="form" label-width="100px" class="form-contain">
            <el-form-item label="社团Id">
                <el-input v-model="form.id"></el-input>
            </el-form-item>
            <el-form-item label="社团名称">
                <el-input v-model="form.name"></el-input>
            </el-form-item>

            <el-form-item label="社团介绍">
                <el-input type="textarea" v-model="form.info"></el-input>
            </el-form-item>

            <el-form-item label="社团人数">
                <el-input v-model="form.count"></el-input>
            </el-form-item>

            <el-form-item label="社团创建人">
                <el-input v-model="form.creator"></el-input>
            </el-form-item>

            <!-- <el-form-item>
                <el-button type="info" @click="onSubmit">注册社团</el-button>
                <el-button @click="onCancel">取消</el-button>
            </el-form-item> -->
        </el-form>

        <el-row>
            <div class="grid-content">
                <el-card class="box-card">
                    <div slot="header" class="clearfix">
                        <span>社团成员</span>
                        <!-- <el-button style="float: right; padding: 3px 0" type="text">操作按钮</el-button> -->
                    </div>
                    <div v-for="c in clubPersons"  class="text item">
                        <el-table
                            ref="multipleTable"
                            :data="clubPersons"
                            border
                            tooltip-effect="dark"
                            style="width: 100%">
                            <el-table-column
                                type="selection">
                            </el-table-column>

                            <el-table-column
                                prop="id"
                                label="id" header-align="center" align="center">
                            </el-table-column>

                            <el-table-column
                                prop="user_id"
                                label="用户id" header-align="center" align="center">
                            </el-table-column>

                            <el-table-column
                                prop="club_id"
                                label="社团id" header-align="center" align="center">
                            </el-table-column>

                            <el-table-column
                                width="160"
                                label="加入日期" header-align="center" align="center">
                                <template scope="scope">
                                    <el-icon name="time"></el-icon>
                                    <span style="margin-left: 10px">{{ scope.row.create_time}}</span>
                                </template>
                            </el-table-column>
                        </el-table>
                    </div>
                </el-card>
            </div>
        </el-row>
    </div>
</template>

<script>

    export default {
        name: 'club-info',
        computed: {
            user () {
                return this.$store.state.user;
            }
        },
        data() {
            //console.log(this.user);
            return {
                form: {
                    id: this.$route.query.club_id,
                    name: '',
                    info: '',
                    creator: '',
                    count: 0,
                    create_time: ''

                }, 
                clubPersons: []
            }
        },
        methods: {
            onSubmit () {
                //console.log(this.user);
                if (!this.form.name) {
                    this.$message.warning('请填写完整信息');
                    return;
                }

                this.form.creator = this.user.user_id;
                //console.log(this.form);
                this.func.ajaxPost(this.api.clubAdd, this.form, res => {
                    if (res.data.code === 200) {
                        this.$message.success('注册社团成功');
                        this.$router.push('/admin/club-list');
                    }
                });
            },

            getParams () {
                // 将数据放在当前组件的数据内
                this.form.id = this.$route.query.club_id;
            },

            onCancel() {

            },

            fetch(){
               this.func.ajaxPost(this.api.clubDetail, {id: this.form.id}, res => {
                    if (res.data.code === 200) {
                        var data = res.data.club;
                        console.log(res.data);
                        for(var key in this.form){
                            this.form[key] = data.club[key];
                        }
                        this.clubPersons = data.clubPersons;

                        console.log(this.form);
                    }
                }); 
            }

        },
        watch: {
            // 监测路由变化,只要变化了就调用获取路由参数方法将数据存储本组件即可
            //'$route': 'getParams'
        },
        created () {
            this.fetch();
        }

    }
</script>