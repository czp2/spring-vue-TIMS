package com.xxxy.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Views {
    private int vid;
    private String vname;
    private String address;
    private String details;
    private float ticket;
    private int nov;
    private String line;
}
