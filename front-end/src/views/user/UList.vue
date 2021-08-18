<template>
  <div>
    <el-container style="height: 500px;">
      <el-table
        :data="userData"
      >
        <el-table-column prop="uid" label="用户id" width="150">
        </el-table-column>
        <el-table-column prop="uname" label="用户姓名" width="150">
        </el-table-column>
        <el-table-column prop="upwd" label="用户密码" width="150">
        </el-table-column>
        <el-table-column prop="email" label="用户邮箱" width="250">
        </el-table-column>
        <el-table-column align="right" min-width="100">
<!--          <template slot="header" slot-scope="scope">-->
<!--            <el-input-->
<!--              v-model="search"-->
<!--              size="mini"-->
<!--              style="width: 150px"-->
<!--              ref='searchInput'-->
<!--              @input="queryData"-->
<!--              placeholder="输入关键字搜索"/>-->
<!--          </template>-->
          <template slot-scope="scope">　
            <el-button type="info"  @click="updateDialog(scope.row)">修改</el-button>
            <el-button type="warning" @click="deleteUser(scope.row.uid)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-footer style="text-align: center">
<!--        <el-pagination-->
<!--          background-->
<!--          layout="prev, pager, next"-->
<!--          :total="total"-->
<!--          >-->
<!--        </el-pagination>-->
      </el-footer>
    </el-container>
    <el-dialog title="修改用户信息" :visible.sync="dialogFormVisible">
      <el-form :model="form" style="text-align: center">
        <el-form-item label="姓名" :label-width="formLabelWidth">
          <el-input v-model="form.uname" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="密码" :label-width="formLabelWidth">
          <el-input v-model="form.upwd" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="邮箱" :label-width="formLabelWidth">
          <el-input v-model="form.email" autocomplete="off"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">返 回</el-button>
        <el-button type="primary" @click="updateUser(form)">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  export default {
    name: "UserList",
    data() {
      return {
        search: '',
        searchData:'',
        total: null,
        userData: [],
        dialogFormVisible: false,
        form: {
          uname: '',
          upwd: '',
          email: '',
        },
        formLabelWidth: '60px',
      }
    },
    created: function () {
      const that = this
      this.$axios.get('http://localhost:8080/back-end/queryUserCounts').then(resp=> {
        that.total = resp.data
        console.log(that.total)
        this.$axios.get('http://localhost:8080/back-end/queryAllUser/0/'+that.total).then(resp=> {
          that.userData = resp.data
          // that.total = resp.data.size()
        })
      })
    },
    methods: {
      // queryData(){
      //   let search = this.search;
      //   this.searchData = this.userData.filter(function (user) {
      //     console.log('过滤', user);
      //     let searchField = { uid: user.uid};
      //     return Object.keys(searchField).some(function (key) {
      //       console.log('key值', key);
      //       return String(user[key]).toLowerCase().indexOf(search) > -1;
      //     });
      //   });
      // },
      updateDialog(row) {
        this.dialogFormVisible = true
        this.form = Object.assign(row);//将数据传入dialog页面
      },
      updateUser(form){
        this.$axios.post('http://localhost:8080/back-end/updateUser',this.form).then(resp=>{
          this.dialogFormVisible = false
        })
      },
      deleteUser(uid) {
        this.$confirm('此操作将永久删除, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$axios.get('http://localhost:8080/back-end/deleteUserById/'+uid)
          this.$message({
            type: 'success',
            message: '删除成功!'
          });
          window.location.href="/user/list"
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });
        });
      }
    }
  }
</script>

