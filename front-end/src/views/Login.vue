<template>
  <div class="div-bg">
    <div class="div-login">
      <el-form ref="loginForm" :model="admin" :rules="rules" label-width="100px">
        <h3 class="login-title">旅游信息管理系统管理员登录</h3>
        <el-form-item label="账号" prop="username" style="width: 500px">
          <el-input type="text" placeholder="请输入账号" v-model="admin.aname" clearable/>
        </el-form-item>
        <el-form-item label="密码" prop="password" style="width: 500px">
          <el-input type="password" placeholder="请输入密码" v-model="admin.apwd" show-password clearable/>
        </el-form-item>
        <el-form-item style="width: 500px;">
          <el-button type="primary" @click="onSubmit('loginForm')">登录</el-button>
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script>
  export default {
    name: "Login",
    data() {
      return {
        admin: {aname: "", apwd: ""},
        //表单验证
        rules: {
          aname: [
            {required: true, message: '账号不可为空', trigger: 'blur'}
          ],
          apwd: [
            {required: true, message: '密码不可为空', trigger: 'blur'}
          ],
        },
      }
    },
    methods: {
      onSubmit(loginForm) {
        this.$refs[loginForm].validate((valid) => {
          if (valid) {
            this.$axios.post('http://localhost:8080/back_end_war_exploded/login', this.admin).then(resp=> {
              if (resp.data == 1) {
                // this.$router.push("/main");
                this.$router.push({path: '/main',query: {name: this.admin.aname}})
              } else {
                return false;
              }
            })
          } else {
            return false;
          }
        });
      }
    }
  }
</script>

<style>
  .div-bg {
    width: 100%;
    height: 600px;
    display: flex;
    justify-content: center;
    align-items: center;
    background: -webkit-linear-gradient(cornflowerblue, lightskyblue);
  }

  .div-login {

    width: 46%;
    height: 300px;
    text-align: center;
    border: 1px solid;
    box-shadow: 0 2px 12px 0 rgba(0, 0, 0, 0.1);
    border-radius: 30px;
    background-color: azure;
  }

</style>
