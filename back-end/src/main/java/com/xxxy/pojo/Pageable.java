package com.xxxy.pojo;

import java.util.List;

/**
 * @ClassName: Pageable
 * @Description: TODO
 **/
public class Pageable<T> {
    private Integer total;
    private Integer size;
    private List<T> list;
    private Integer fromIndex;
    private Integer toIndex;

    private Integer pages;

    public Integer getPages() {
        return pages;
    }

    public void setToIndex(Integer toIndex) {
        this.toIndex = toIndex;
    }

    public Integer getFromIndex() {
        return fromIndex;
    }

    public void setFromIndex(Integer fromIndex) {
        this.fromIndex = fromIndex;
    }

    public Integer getToIndex() {
        return toIndex;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public Pageable(List<T> list, int size) {
        this.list = list;
        this.total = list.size();
        this.size = size;
        this.pages = (int) Math.ceil(1.0 * total / size);

    }

    // 分页方法，页数从1开始，小于1就初始化为1
    public List<T> pageable(int page) {
        if (page < 1) page = 1;
        if (page > pages) page = pages;
        int fromIndex = (page - 1) * size;
        int toIndex = page * size;
        //如果索引超过数组长度，就变成数组长度
        toIndex = Math.min(toIndex, total);
        this.fromIndex = fromIndex + 1;
        this.toIndex = toIndex;
        return list.subList(fromIndex, toIndex);
    }
}