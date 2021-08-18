<template>
  <el-container style="height: 600px; border: 1px solid #eee">
      <el-header style="text-align: right; font-size: 12px">
      <el-dropdown>
        <i class="el-icon-setting" style="margin-right: 15px"></i>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item @click.native="logout">退出登录</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <span><i class="el-icon-s-custom"></i>{{aname}}</span>
    </el-header>

    <el-container style="height: 510px; border: 1px solid #eee">
      <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
        <el-menu>
          <el-submenu index="1">
            <template slot="title">
              <i class="el-icon-user-solid"></i>
              <span>用户信息管理</span>
            </template>
            <el-menu-item index="1-1" @click="showUList()">
              用户列表
            </el-menu-item>
<!--            <el-menu-item index="1-2">-->
<!--              <el-button type="text" @click="searchUser()">查找用户</el-button>-->
<!--            </el-menu-item>-->
          </el-submenu>
          <el-submenu index="2">
            <template slot="title">
              <i class="el-icon-location"></i>
              <span>景点信息管理</span>
            </template>
            <el-menu-item-group>
              <el-menu-item index="2-1" @click="showVList()">
                景点列表
              </el-menu-item>
              <el-menu-item index="2-2" @click="createView()">
                增加景点
              </el-menu-item>
<!--              <el-menu-item index="2-3">-->
<!--                <el-button type="text" @click="searchView()">查找景点</el-button>-->
<!--              </el-menu-item>-->
            </el-menu-item-group>
          </el-submenu>
          <el-submenu index="3">
            <template slot="title">
              <i class="el-icon-pie-chart"></i>
              <span>数据统计</span>
            </template>
            <el-menu-item-group>
              <el-menu-item index="4-1" @click="showSList">
                评星统计
              </el-menu-item>
            </el-menu-item-group>
          </el-submenu>
        </el-menu>
      </el-aside>

      <el-main>
        <router-view></router-view>
      </el-main>
    </el-container>

    <el-footer style="text-align: center;font-size: 15px">
      <span>© 2020 旅游信息管理系统 小组</span>
    </el-footer>
  </el-container>

</template>

<script>
  export default {
    data() {
      return {
        aname: null,
        dialogTableVisible: false,
        dialogFormVisible: false,
        form: {
          name: '',
          address: '',
          detail: '',
          ticket: '',
          line: ''
        },
        formLabelWidth: '80px'
      };
    },
    created() {
      this.aname = this.$route.query.name
    },
    methods: {
      logout() {
        this.$router.push({path: '/'})
      },
      showUList() {
        this.$router.push({path: '/user/list'})
      },
      searchUser() {
        this.$router.push({path: '/user/list'})
      },
      showVList() {
        this.$router.push({path: '/view/list'})
      },
      searchView(){

      },
      showSList() {
        this.$router.push({path: '/statistics/list'})
      },
      createView() {
        this.$router.push({path: '/view/create'})
      }
    }
  };
</script>

<style>
  .el-header {
    background-color: #B3C0D1;
    color: #333;
    line-height: 60px;
  }

  .el-aside {
    color: #333;
  }
</style>
