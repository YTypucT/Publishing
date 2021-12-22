package com.example.demo.entity;

import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;
import java.io.Serializable;

@Embeddable
@NoArgsConstructor
public class Structure_of_order_id implements Serializable {
    private int Code_book;
    private int No_order;

    public Structure_of_order_id(int code_book, int no_order) {
        Code_book = code_book;
        No_order = no_order;
    }
}
