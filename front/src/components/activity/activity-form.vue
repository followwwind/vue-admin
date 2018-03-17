<template>
    <el-form ref="form" :model="form" label-width="80px" class="form-contain" style="margin-top: 100px;">
        <el-form-item label="活动名称">
            <el-input v-model="form.name"></el-input>
        </el-form-item>

        <el-form-item label="活动介绍">
            <el-input type="textarea" v-model="form.info"></el-input>
        </el-form-item>

        <el-form-item label="活动日期">
            <el-col :span="11">
              <el-date-picker type="datetime" placeholder="开始时间" v-model="form.start_time" style="width: 100%;"></el-date-picker>
            </el-col>
            <el-col :span="2" style="text-align:center;">-</el-col>
            <el-col :span="11">
              <el-date-picker type="datetime" placeholder="结束时间" v-model="form.end_time" style="width: 100%;"></el-date-picker>
            </el-col>
        </el-form-item>

        <el-form-item style="text-align:center">
            <el-button type="success" @click="onSubmit">发布活动</el-button>
            <el-button @click="onCancel">取消</el-button>
        </el-form-item>
    </el-form>
</template>

<script>

    export default {
        name: 'activity-form',
        computed: {
            user () {
                return this.$store.state.user;
            }
        },
        data() {
            return {
                form: {
                    name: '',
                    info: '',
                    start_time: "",
                    end_time: "",
                    creator: ''
                }  
            }
        },
        methods: {
            onSubmit () {
                if (!this.form.name) {
                    this.$message.warning('请填写完整信息');
                    return;
                }

                //console.log(this.form);
                this.form.creator = this.user.user_id;
                this.func.ajaxPost(this.api.activityAdd, this.form, res => {
                    if (res.data.code === 200) {
                        this.$message.success('发布成功');
                        this.$router.push('/admin/activity-list');
                    }
                });
            },

            onCancel () {
                this.$router.push('/admin/activity-list');
            },

        },

    }
</script>