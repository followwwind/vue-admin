<template>
    <el-form ref="form" :model="form" label-width="80px" class="form-contain" style="margin-top: 100px;">
        <el-form-item label="社团名称">
            <el-input v-model="form.name"></el-input>
        </el-form-item>

        <el-form-item label="社团介绍">
            <el-input type="textarea" v-model="form.info"></el-input>
        </el-form-item>

        <el-form-item label="社团人数">
            <el-select v-model="form.count" placeholder="请选择社团人数" style="width:100%">
                <el-option label="10个人" value="10"></el-option>
                <el-option label="30个人" value="30"></el-option>
                <el-option label="50个人" value="50"></el-option>
                <el-option label="70个人" value="70"></el-option>
                <el-option label="90个人" value="90"></el-option>
            </el-select>
        </el-form-item>

        <el-form-item style="text-align:center">
            <el-button type="info" @click="onSubmit">注册社团</el-button>
            <el-button @click="onCancel">取消</el-button>
        </el-form-item>
    </el-form>
</template>

<script>

    export default {
        name: 'club-form',
        computed: {
            user () {
                return this.$store.state.user;
            }
        },
        data() {
            //console.log(this.user);
            return {
                form: {
                    name: '',
                    info: '',
                    count: '',
                    creator: ''
                }  
            }
        },
        methods: {
            onSubmit () {
                //console.log(this.user);
                if (!this.form.name) {
                    this.$message.warning('请填写社团名称');
                    return;
                }

                if (!this.form.info) {
                    this.$message.warning('请填写社团介绍');
                    return;
                }

                if (!this.form.count) {
                    this.$message.warning('请选择社团人数');
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

            onCancel () {
                this.$router.push('/admin/club-list');
            },

        },

    }
</script>