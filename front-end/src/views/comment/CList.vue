<template>
  <div>
    <el-page-header @back="goBack" content="景点评论详情">
    </el-page-header>
    <el-table
      :data="cData"
    >
      <el-table-column prop="cid" label="评论id" width="120">
      </el-table-column>
      <el-table-column prop="uid" label="用户id" width="120">
      </el-table-column>
      <el-table-column prop="content" label="内容" width="160">
      </el-table-column>
      <el-table-column prop="star" label="评星" width="120">
      </el-table-column>
      <el-table-column prop="createtime" label="创建时间" width="160">
      </el-table-column>
      <el-table-column label="操作" align="center" min-width="100">
        <template slot-scope="scope">
          <el-button type="warning" @click="deleteCom(scope.row.uid)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
  </div>
</template>

<script>
  export default {
    name: "CList",
    data() {
      return {
        cData:[]
      }
    },
    created: function () {
      const that = this
      let id = this.$route.query.id
      this.$axios.get('http://localhost:8080/back-end/queryVidComment/'+id).then(resp=> {
        that.cData = resp.data
        // that.total = resp.data.size()
      })
    },
    methods: {
      goBack() {
        window.location.href = "javascript:history.go(-1)";
      },
      deleteCom(cid) {
        this.$confirm('此操作将永久删除, 是否继续?', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$axios.get('http://localhost:8080/back-end/deleteCommentById/'+cid)
          this.$message({
            type: 'success',
            message: '删除成功!'
          });
          window.location.reload()
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


