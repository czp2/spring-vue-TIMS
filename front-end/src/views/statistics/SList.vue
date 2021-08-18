<template>
  <el-table
    :data="sData"
  >
    <el-table-column prop="vid" label="景点id" width="80"/>
    <el-table-column prop="vname" label="景点名称" width="200"/>
    <el-table-column prop="one" label="★" width="100" />
    <el-table-column prop="two" label="★★" width="100" />
    <el-table-column prop="three" label="★★★" width="100" />
    <el-table-column prop="four" label="★★★★" width="100" />
    <el-table-column prop="five" label="★★★★★" width="100" />
    <el-table-column prop="avg" label="综合指数" width="120"/>
  </el-table>
</template>

<script>
  export default {
    name: "SList",

    data() {
      return {
        sData: [
          {
            vid:"",
            vname:"",
            one:"",
            two:"",
            three:"",
            four:"",
            five:"",
            avg:"",
          }
        ],

      }
    },
    created: function () {
      const that = this
      this.$axios.get('http://localhost:8080/back-end/dataStatistics').then(resp => {
        console.log(resp)
        that.sData = resp.data
        console.log(that.sData)
        // that.total = resp.data.size()
      })
    },
  }
</script>

