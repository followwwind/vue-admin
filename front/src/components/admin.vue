<template>
    <div class='admin'>
        <my-header></my-header>

        <div class='admin-main'>
            <div class='admin-main-right'>
                <el-menu theme="dark" class="top-menu">
                    <el-submenu index="1">
                        <template slot="title">会员</template>
                        <router-link to="/admin/club-join">
                            <el-menu-item index="1-1">加入社团</el-menu-item>
                        </router-link>

                        <router-link to="/admin/activity-list">
                            <el-menu-item index="1-2">最新活动</el-menu-item>
                        </router-link>
                    </el-submenu>

                    <el-submenu index="2">
                        <template slot="title">管理员</template>
                        <el-menu-item index="2-1"
                                      @click="controlJump('/admin/activity-form')">发布活动
                        </el-menu-item>

                        <el-menu-item index="2-2"
                                      @click="controlJump('/admin/user-list')">成员管理
                        </el-menu-item>
                        <el-menu-item index="2-3"
                                      @click="controlJump('/admin/club-form')">注册社团
                        </el-menu-item>
                    </el-submenu>
                    <el-submenu index="3">
                        <template slot="title">教师</template>
                        <el-menu-item index="2-1"
                                      @click="controlJump('/admin/club-list')">社团管理
                        </el-menu-item>

                        <el-menu-item index="2-2"
                                      @click="controlJump('/admin/user-list')">成员管理
                        </el-menu-item>
                    </el-submenu>
                </el-menu>
            </div>

            <div class='admin-main-left'>
                <router-view v-bind:user="user"></router-view>
            </div>

        </div>
    </div>
</template>

<script>
    import Header from './common/header.vue';

    export default {
        name: 'admin',

        components: {
            'my-header': Header,
        },

        computed: {
            user () {
                return this.$store.state.user;
            }
        },
        data (){
            return {
                //user: this.user
            }
        },
        methods: {
            // 跳转控制
            controlJump (target) {
                if (this.user.role < 10) {
                    this.$message.warning('权限不够，努力升级');

                } else {
                    this.$router.push(target);
                }

            }
        },

    }
</script>