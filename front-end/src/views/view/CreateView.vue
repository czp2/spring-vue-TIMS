<template>
  <el-form :model="views" :rules="rules" ref="createForm" label-width="100px" class="createForm">
    <el-form-item label="景点名称" prop="vname">
      <el-input v-model="views.vname"></el-input>
    </el-form-item>
    <el-form-item label="景点地址" prop="address">
      <el-input v-model="views.address"></el-input>
    </el-form-item>
    <el-form-item label="景点门票" prop="ticket">
      <el-input v-model="views.ticket"></el-input>
    </el-form-item>
    <el-form-item label="景点描述" prop="details">
      <el-input type="textarea" v-model="views.details"></el-input>
    </el-form-item>
    <el-form-item label="景点图片">
      <div style="padding-left: 30px">
        <el-upload
          action=""
          :auto-upload='false'
          :file-list="fileList"
          :on-change="handleChange"
        >
          <!-- action 我这里演示手动上传就不需要选择服务器地址,但是该参数必须要,不然会报错 -->
          <!-- :auto-upload='false' 改属性默认为 true 会默认直接提交文件 我这边手动提交所以选择 false-->
          <!-- :file-list="fileList" 官网上是上传的文件列表, 我这边为了单文件,实现第二次选择上传清空-->
          <!-- :on-change="handleChange" 文件状态改变时的钩子函数 -->
          <!-- 你可以自己测试完成之后,添加更多的样式 -->
          <!--该按钮选取文件 是el-upload组件的一个插槽,不添加改方法你不能选取文件-->
          <el-button slot="trigger" type="primary" @click="delFile">选取文件</el-button>
          <!--单击上传到服务器(提交)按钮 -->
          <el-button type="success" @click="submitUpload">上传到服务器</el-button>
        </el-upload>
      </div>
      <br>
    </el-form-item>


    <el-form-item>
      <el-button type="primary" @click="submitForm('createForm')">确认</el-button>
      <el-button @click="resetForm('createForm')">重置</el-button>
    </el-form-item>
  </el-form>
</template>

<script>
  export default {
    name: 'CView',

    data() {
      return {
        views: {
          vname: "",
          address: "",
          details: "",
          ticket:"",
          line: ""
        },
        rules: {
          vname: [
            { required: true, message: '请输入景点名称', trigger: 'blur' },
            { min: 4, max: 30, message: '长度在 4 到 30 个字符', trigger: 'blur' }
          ],
          address: [
            { required: true, message: '请输入景点地址', trigger: 'blur' },
            { min: 4, max: 30, message: '长度在 4 到 30 个字符', trigger: 'blur' }
          ],
          details: [
            { required: true, message: '请输入景点信息', trigger: 'blur' },
            { min: 20, max: 200, message: '长度在 20 到 200 个字符', trigger: 'blur' }
          ],
          ticket: [
            { required: true, message: '请输入门票价格', trigger: 'blur' },
            { min: 1, max: 5, message: '长度在 1 到 5 个字符', trigger: 'blur' }
          ],

        },
        fileList: [],

      };
    },
    methods: {
      submitForm(createForm) {
        this.$refs[createForm].validate((valid) => {
          if (valid) {
            this.$axios.post('http://localhost:8080/back-end/addViews',this.views).then(resp=>{
              console.log(resp)
              alert('已经增加了一条信息');
            })

          } else {
            console.log('未知错误');
            return false;
          }
        });
      },
      /*重新选择的时候清楚原来的文件*/
      delFile() {
        this.fileList = [];
      },
      /*文件状态改变时的钩子函数*/
      handleChange(file, fileList) {//该方法很重要,从你选择的fileList文件赋值给你定义的this.fileList
        this.fileList = fileList;
      },
      /*单击上传到服务器(提交)按钮*/
      submitUpload() {
        let formData = new FormData();//文件转换
        //fileList 对应你服务器接受名称
        formData.append("fileList", this.fileList[0].raw);
        //这边"$http"我重新封装了axios,你可以改成自己的.但是必须是post来请求,
        //http://localhost:8082/yiban_zlj/fileUpload改成你服务器文件上传的API地址
        //formData请求带的数据
        //{"Content-Type": "multipart/form-data;charset=utf-8"}是文件上传必须要的
        //最后可以打印返回的服务器返回的数据,如果控制台报错接受你哪里没有写对
        this.$axios.post('http://localhost:8080/back-end/saveImg', formData, {"Content-Type": "multipart/form-data;charset=utf-8"}).then(res => {
          console.log(res)
          this.views.line=res.data;
        })
      }

    }
  }
</script>

<style scoped>

</style>
