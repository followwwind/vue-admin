<template>
    <el-form ref="form" :model="form" label-width="80px" class="form-contain" style="text-align:center;margin-top:150px;">
        <el-form-item>
            <h1 style="font-size:30px;">社团加入主页</h1>
        </el-form-item>
        <el-form-item>
            <label for="">选择社团：</label>
            <el-select v-model="form.club_id" placeholder="请选择社团">
                <el-option v-for="item in clubs"
                    :label="item.name"
                    :value="item.id">
                </el-option>
            </el-select>
        </el-form-item>

        <el-form-item>
            <el-button type="info" @click="onSubmit">加入社团</el-button>
        </el-form-item>
    </el-form>
    
</template>

<script>

    export default {
        name: 'club-join',
        computed: {
            user () {
                return this.$store.state.user;
            }
        },
        data() {
            return {
                clubs: [],
                form: {
                    club_id: '',
                    user_id: ''
                }
            }
        },
        methods: {
            fetchList () {
                this.func.ajaxGet(this.api.clubList, res => {
                    if (res.data.code === 200) {
                        //console.log(res.data.activities);
                        this.clubs = res.data.clubs;
                    }
                });
            },
            onSubmit () {
                this.form.user_id = this.user.user_id;
                console.log(this.form);

                this.func.ajaxPost(this.api.joinClub, this.form, res => {
                    if (res.data.code === 200) {
                        this.$message.success('加入社团成功');
                        this.$router.push('/admin/club-list');
                    }
                });
            },

            onCancel () {
                this.$router.push('/admin/club-list');
            },

        },
        created () {
            this.fetchList();
        }

    }
</script>