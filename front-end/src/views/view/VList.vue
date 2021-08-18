<template>
  <div>
    <el-table
      :data="vData"
      highlight-current-row
      border
      height="450"
      style="width: 100%"
    >
      <el-table-column prop="vid" label="id" width="40" fixed>
      </el-table-column>
      <el-table-column prop="vname" label="名称" width="120">
      </el-table-column>
      <el-table-column prop="address" label="地址" width="120">
      </el-table-column>
      <el-table-column prop="details" label="描述" width="500">
      </el-table-column>
      <el-table-column prop="ticket" label="门票(元)" width="100">
      </el-table-column>
      <el-table-column prop="nov" label="浏览人次(人)" width="120">
      </el-table-column>
      <el-table-column prop="line" label="图片名称" width="150">
      </el-table-column>
      <el-table-column label="图片" width="150">
        <template slot-scope="list">
          <span class="demonstration"></span>
          <el-image
            style="width: 60px; height: 80px"
            :src="getUrl(list.row.line)"
            :fit="fit"></el-image>
        </template>
      </el-table-column>
      <el-table-column width="290" align="center" label="操作" fixed="right">
        <!--        <template slot="header" slot-scope="scope">-->
        <!--          <el-input-->
        <!--            v-model="search"-->
        <!--            size="mini"-->
        <!--            type="text"-->
        <!--            style="width: 250px"-->
        <!--            placeholder="输入关键字搜索"/>-->
        <!--        </template>-->
        <template slot-scope="scope">　
          <el-button type="info" @click="updateDialog(scope.row)">修改</el-button>
          <el-button type="info" @click="showCList(scope.row.vid)">查看评论</el-button>
          <el-button type="warning" @click="deleteView(scope.row.vid)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <el-dialog title="修改景点信息" :visible.sync="dialogFormVisible">
      <el-form :model="form" style="text-align: center">
        <el-form-item label="名称" :label-width="formLabelWidth">
          <el-input v-model="form.vname" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="地址" :label-width="formLabelWidth">
          <el-input v-model="form.address" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="描述" :label-width="formLabelWidth">
          <el-input v-model="form.details" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="门票" :label-width="formLabelWidth">
          <el-input v-model="form.ticket" autocomplete="off"></el-input>
        </el-form-item>
        <el-form-item label="路径" :label-width="formLabelWidth">
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
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button type="primary" @click="updateView(form)">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  export default {
    name: "ViewList",
    data() {
      return {
        vData: [],
        total: '',
        search: '',
        dialogFormVisible: false,
        form: {
          vname: '',
          address: '',
          details: '',
          ticket: '',
          line: ''
        },
        fileList: [],
        formLabelWidth: '60px',
        fit: 'contain',
      };
    },
    created: function () {
      const that = this
      this.$axios.get('http://localhost:8080/back-end/queryViewsCounts').then(resp => {
        that.total = resp.data
        this.$axios.get('http://localhost:8080/back-end/queryAllViews/0/' + that.total).then(resp => {
          that.vData = resp.data
          console.log(that.vData)
          // that.total = resp.data.size()
        })
      })
    },
    methods: {
      getUrl(filename) {
        return "http://127.0.0.1:8080/back-end/img/" + filename;
      },
      updateDialog(row) {
        this.dialogFormVisible = true
        this.form = Object.assign(row);//将数据传入dialog页面
      },
      updateView(form) {
        this.$axios.post('http://localhost:8080/back-end/updateViews', this.form).then(resp => {
          this.dialogFormVisible = false
        })
      },
      showCList(vid) {
        this.$router.push({path: '/comment/list', query: {id: vid}})
      },
      deleteView(vid) {
        this.$confirm('此操作将永久删除, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$axios.get('http://localhost:8080/back-end/deleteViewsById/' + vid)
          this.$message({
            type: 'success',
            message: '删除成功!'
          });
          window.location.href = "/view/list"
        }).catch(() => {
          this.$message({
            type: 'info',
            message: '已取消删除'
          });
        });
      },
      /*重新选择的时候清除原来的文件*/
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
          this.form.line = res.data;
        })
      }
    }
  }
</script>

